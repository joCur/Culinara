import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../common/presentation/controllers/flash_controller.dart';
import '../../../common/presentation/widgets/loading_overlay.dart';
import '../../data/repositories/challenge_repository.dart';
import '../../domain/models/challenge.dart';
import '../../domain/models/challenge_attempt.dart';
import '../../domain/models/challenge_result.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../domain/exceptions/challenge_exception.dart';
import '../../../../core/services/sentry_service.dart';

part 'challenge_controller.g.dart';

@riverpod
class ChallengeController extends _$ChallengeController {
  @override
  AsyncValue<Challenge?> build() => const AsyncValue.data(null);

  Future<ChallengeAttempt> acceptChallenge(
      BuildContext context, Challenge challenge) async {
    final loadingOverlay = LoadingOverlay.of(context);
    loadingOverlay.show();

    try {
      final repository = ref.read(challengeRepositoryProvider);
      final challengeRef = await repository.saveChallenge(
        challenge: challenge,
      );

      // Dann Attempt erstellen und speichern
      final attempt = ChallengeAttempt(
        id: '', // wird von Firestore gesetzt
        challengeRef: challengeRef,
        userId: ref.read(userProfileProvider).value!.uid,
        startedAt: DateTime.now(),
        status: ChallengeStatus.started,
      );

      final attemptRef = await repository.saveChallengeAttempt(attempt);

      if (context.mounted) {
        loadingOverlay.hide();
        ref.read(flashControllerProvider.notifier).showSuccess(
              context,
              LocaleKeys.challenge_success_accepted.tr(),
            );
      }

      return attempt.copyWith(id: attemptRef.id);
    } on ChallengeException catch (e) {
      if (context.mounted) {
        loadingOverlay.hide();
        ref.read(flashControllerProvider.notifier).showError(
              context,
              e.message,
            );
      }
      rethrow;
    } catch (e, stackTrace) {
      if (context.mounted) {
        loadingOverlay.hide();
        ref.read(flashControllerProvider.notifier).showError(
              context,
              LocaleKeys.challenge_errors_acceptFailed.tr(),
            );
      }
      await SentryService.reportError(
        e,
        stackTrace,
        hint: 'Challenge acceptance failed',
        extras: {
          'ingredients': challenge.ingredients.map((i) => i.toJson()).toList(),
        },
      );
      rethrow;
    }
  }

  Future<void> generateNewChallenge(BuildContext context) async {
    state = const AsyncValue.loading();

    final result =
        await ref.read(challengeRepositoryProvider).generateChallenge(
              diet: [],
              availability: 'Alles',
              season: [],
              numIngredients: 3,
            );

    state = result.when(
      success: (challenge) => AsyncValue.data(challenge),
      failure: (error) => const AsyncValue.data(null),
    );

    if (result case Failure(error: final error)) {
      if (!context.mounted) return;
      ref.read(flashControllerProvider.notifier).showError(
            context,
            error.message,
            action: FlashAction(
              label: LocaleKeys.challenge_actions_tryAgain.tr(),
              onPressed: () => generateNewChallenge(context),
            ),
          );
    }
  }
}
