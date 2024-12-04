import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../data/repositories/challenge_repository.dart';
import '../../domain/models/challenge.dart';
import '../../domain/models/ingredient.dart';

part 'challenge_controller.g.dart';

@riverpod
class ChallengeController extends _$ChallengeController {
  @override
  AsyncValue<List<Ingredient>?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> generateNewChallenge() async {
    state = const AsyncValue.loading();

    try {
      final ingredients =
          await ref.read(challengeRepositoryProvider).generateChallenge(
                diet: [
                  'vegetarian'
                ], // Diese Werte sollten später aus den User-Präferenzen kommen
                availability: 'all',
                season: ['summer'],
                numIngredients: 3,
              );

      state = AsyncValue.data(ingredients);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
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
