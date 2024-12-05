import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../common/presentation/controllers/flash_controller.dart';
import '../../data/repositories/challenge_repository.dart';
import '../../domain/models/challenge.dart';
import '../../domain/models/challenge_attempt.dart';
import '../../domain/models/ingredient.dart';
import '../../domain/models/challenge_result.dart';
import '../../../../generated/locale_keys.g.dart';

part 'challenge_controller.g.dart';

@riverpod
class ChallengeController extends _$ChallengeController {
  @override
  AsyncValue<List<Ingredient>?> build() {
    return const AsyncValue.data(null);
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
      success: (ingredients) => AsyncValue.data(ingredients),
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

  Future<void> acceptChallenge(BuildContext context) async {
    if (state.value == null) return;

    final userId = ref.read(userProfileProvider).value?.uid;
    if (userId == null) {
      if (!context.mounted) return;
      ref.read(flashControllerProvider.notifier).showError(
            context,
            LocaleKeys.challenge_errors_noUser.tr(),
          );
      return;
    }

    try {
      // Challenge erstellen
      final challenge = Challenge(
        id: '', // wird von Firestore generiert
        ingredients: state.value!,
        createdAt: DateTime.now(),
        creatorId: userId,
      );

      final challengeRef =
          await ref.read(challengeRepositoryProvider).saveChallenge(challenge);

      // Dann den Attempt erstellen
      final attempt = ChallengeAttempt(
        id: '', // wird von Firestore generiert
        challengeRef: challengeRef,
        userId: userId,
        startedAt: DateTime.now(),
        status: ChallengeStatus.started,
      );

      await ref.read(challengeRepositoryProvider).saveChallengeAttempt(attempt);

      if (!context.mounted) return;

      // Erfolgsmeldung anzeigen
      ref.read(flashControllerProvider.notifier).showSuccess(
            context,
            LocaleKeys.challenge_success_accepted.tr(),
          );

      context.pop(); // Zurück zum Home Screen
    } catch (e) {
      if (!context.mounted) return;
      ref.read(flashControllerProvider.notifier).showError(
            context,
            LocaleKeys.challenge_errors_acceptFailed.tr(),
            action: FlashAction(
              label: LocaleKeys.challenge_actions_tryAgain.tr(),
              onPressed: () => acceptChallenge(context),
            ),
          );
    }
  }
}
