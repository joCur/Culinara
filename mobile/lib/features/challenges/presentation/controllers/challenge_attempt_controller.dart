import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/challenge_attempt.dart';
import '../../data/repositories/challenge_repository.dart';

part 'challenge_attempt_controller.g.dart';

@riverpod
Future<ChallengeAttempt> challengeAttempt(
  Ref ref,
  String attemptId,
) async {
  return ref.watch(challengeRepositoryProvider).getChallengeAttempt(attemptId);
}

@riverpod
class ChallengeAttemptController extends _$ChallengeAttemptController {
  @override
  FutureOr<void> build() => null;

  Future<void> updateStatus(String attemptId, ChallengeStatus newStatus) async {
    final repository = ref.read(challengeRepositoryProvider);
    await repository.updateChallengeStatus(attemptId, newStatus);
  }

  Future<void> submitFeedback(
    String attemptId,
    String feedback,
    int rating,
  ) async {
    final repository = ref.read(challengeRepositoryProvider);
    await repository.updateChallengeFeedback(attemptId, feedback, rating);
  }
}
