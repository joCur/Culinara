import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../../data/repositories/challenge_repository.dart';
import '../../domain/models/challenge_attempt.dart';

part 'active_challenges_controller.g.dart';

@riverpod
Stream<List<ChallengeAttempt>> activeChallenges(Ref ref) {
  final user = ref.watch(userProfileProvider).value;
  if (user == null) return Stream.value([]);

  return ref.watch(challengeRepositoryProvider).watchActiveAttempts(user.uid);
}
