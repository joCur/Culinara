import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../common/presentation/constants/ui_constants.dart';
import '../controllers/challenge_attempt_controller.dart';
import '../../../common/presentation/widgets/loading_overlay.dart';
import '../../../common/presentation/controllers/flash_controller.dart';
import '../widgets/details/challenge_reflection_section.dart';

class ChallengeReflectionScreen extends ConsumerWidget {
  static const String name = 'challenge-reflection';
  static const String path = '/challenge/:id/reflection';

  final String attemptId;

  const ChallengeReflectionScreen({
    super.key,
    required this.attemptId,
  });

  Future<void> _handleSubmission(
    BuildContext context,
    WidgetRef ref, {
    required String dishName,
    required String learnings,
    required int difficultyRating,
    required bool wouldTryAgain,
    List<File>? images,
  }) async {
    final loadingOverlay = LoadingOverlay.of(context);
    loadingOverlay.show();

    try {
      await ref
          .read(challengeAttemptControllerProvider(attemptId).notifier)
          .submitReflection(
            context,
            dishName: dishName,
            learnings: learnings,
            difficultyRating: difficultyRating,
            wouldTryAgain: wouldTryAgain,
            images: images,
          );

      if (context.mounted) {
        loadingOverlay.hide();
        ref.read(flashControllerProvider.notifier).showSuccess(
              context,
              LocaleKeys.challenge_success_reflection_saved.tr(),
            );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (context.mounted) {
        loadingOverlay.hide();
        ref.read(flashControllerProvider.notifier).showError(
              context,
              LocaleKeys.challenge_errors_reflectionFailed.tr(),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.challenge_details_reflection_title.tr()),
      ),
      body: LoadingOverlay(
        child: Builder(
          builder: (context) => SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Spacing.md),
              child: ChallengeReflectionSection(
                attempt: ref
                    .watch(challengeAttemptControllerProvider(attemptId))
                    .value!,
                onReflectionSubmitted: ({
                  required String dishName,
                  required String learnings,
                  required int difficultyRating,
                  required bool wouldTryAgain,
                  List<File>? images,
                }) =>
                    _handleSubmission(
                  context,
                  ref,
                  dishName: dishName,
                  learnings: learnings,
                  difficultyRating: difficultyRating,
                  wouldTryAgain: wouldTryAgain,
                  images: images,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
