import 'dart:io';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/services/sentry_service.dart';
import '../../domain/models/challenge_attempt.dart';
import '../../domain/models/challenge_reflection.dart';
import '../../domain/exceptions/challenge_exception.dart';
import '../../data/repositories/challenge_repository.dart';
import '../../data/repositories/storage_repository.dart';
import '../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../features/common/presentation/controllers/flash_controller.dart';

part 'challenge_attempt_controller.g.dart';

@riverpod
class ChallengeAttemptController extends _$ChallengeAttemptController {
  @override
  Future<ChallengeAttempt> build(String attemptId) async {
    return ref
        .watch(challengeRepositoryProvider)
        .getChallengeAttempt(attemptId);
  }

  Future<void> updateStatus(ChallengeStatus newStatus) async {
    state = await _handleStateUpdate(
      () => ref.read(challengeRepositoryProvider).updateChallengeStatus(
            state.value!.id,
            newStatus,
          ),
      (attempt) => attempt.copyWith(status: newStatus),
    );
  }

  Future<void> submitReflection(
    BuildContext context, {
    required String dishName,
    required String learnings,
    required int difficultyRating,
    required bool wouldTryAgain,
    List<File>? images,
  }) async {
    try {
      final currentAttempt = state.value!;
      List<String>? imageUrls;

      if (images?.isNotEmpty ?? false) {
        imageUrls = await _uploadImages(context, currentAttempt.id, images!);
        if (imageUrls == null) return; // Upload fehlgeschlagen
      }

      state = await _handleStateUpdate(
        () => ref.read(challengeRepositoryProvider).updateChallengeReflection(
              currentAttempt.id,
              dishName: dishName,
              learnings: learnings,
              difficultyRating: difficultyRating,
              wouldTryAgain: wouldTryAgain,
              imageUrls: imageUrls,
            ),
        (attempt) => attempt.copyWith(
          reflection: ChallengeReflection(
            dishName: dishName,
            learnings: learnings,
            difficultyRating: difficultyRating,
            wouldTryAgain: wouldTryAgain,
            imageUrls: imageUrls,
            timestamp: DateTime.now(),
          ),
        ),
      );
    } catch (e, stackTrace) {
      await SentryService.reportError(
        e,
        stackTrace,
        hint: 'Reflection submission failed',
        extras: {
          'attemptId': state.value!.id,
          'dishName': dishName,
          'difficultyRating': difficultyRating,
          'hasImages': images?.isNotEmpty ?? false,
        },
      );
      rethrow;
    }
  }

  Future<AsyncValue<ChallengeAttempt>> _handleStateUpdate(
    Future<void> Function() operation,
    ChallengeAttempt Function(ChallengeAttempt) update,
  ) async {
    final currentAttempt = state.value!;
    final optimisticState = AsyncData(update(currentAttempt));

    state = optimisticState;
    try {
      await _handleRepositoryOperation(
        operation,
        ChallengeErrorType.updateFailed,
        LocaleKeys.challenge_errors_updateFailed.tr(),
      );
      return optimisticState;
    } catch (e) {
      state = AsyncData(currentAttempt);
      rethrow;
    }
  }

  Future<List<String>?> _uploadImages(
    BuildContext context,
    String attemptId,
    List<File> images,
  ) async {
    try {
      final currentAttempt = state.value!;
      return await Future.wait(
        images.map(
            (file) => ref.read(storageRepositoryProvider).uploadChallengeImage(
                  currentAttempt.challengeRef.id,
                  attemptId,
                  file,
                )),
      );
    } catch (e) {
      ref.read(flashControllerProvider.notifier).showError(
            context,
            LocaleKeys.challenge_errors_imageUploadFailed.tr(),
          );
      return null;
    }
  }

  Future<T> _handleRepositoryOperation<T>(
    Future<T> Function() operation,
    ChallengeErrorType errorType,
    String errorMessage,
  ) async {
    try {
      return await operation();
    } catch (e) {
      throw ChallengeException(
        message: errorMessage,
        type: errorType,
        originalError: e,
      );
    }
  }
}
