import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../../common/presentation/controllers/flash_controller.dart';
import '../../data/repositories/challenge_repository.dart';
import '../../domain/models/challenge.dart';
import '../../domain/models/ingredient.dart';
import '../../domain/models/challenge_result.dart';

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
              label: 'Erneut versuchen',
              onPressed: () => generateNewChallenge(context),
            ),
          );
    }
  }

  Future<void> acceptChallenge() async {
    if (state.value == null) return;

    final challenge = Challenge(
      id: '', // wird von Firestore generiert
      ingredients: state.value!,
      createdAt: DateTime.now(),
      userId: ref.read(userProfileProvider).value?.uid ??
          '', // Get current user ID from auth state
    );

    await ref.read(challengeRepositoryProvider).saveChallenge(challenge);
  }
}
