import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/challenge_attempt.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';

final challengeStatsProvider = StreamProvider.autoDispose((ref) {
  final user = ref.watch(userProfileProvider).value;
  if (user == null) return Stream.value(const ChallengeStats());

  return FirebaseFirestore.instance
      .collection('challengeAttempts')
      .where('userId', isEqualTo: user.uid)
      .snapshots()
      .map((snapshot) {
    final attempts = snapshot.docs
        .map((doc) => ChallengeAttempt.fromFirestore(doc, null))
        .toList();

    return ChallengeStats(
      totalCompleted:
          attempts.where((a) => a.status == ChallengeStatus.completed).length,
      currentStreak: _calculateStreak(attempts),
    );
  });
});

class ChallengeStats {
  final int totalCompleted;
  final int currentStreak;

  const ChallengeStats({
    this.totalCompleted = 0,
    this.currentStreak = 0,
  });
}

int _calculateStreak(List<ChallengeAttempt> attempts) {
  if (attempts.isEmpty) return 0;

  final completedAttempts = attempts
      .where((a) => a.status == ChallengeStatus.completed)
      .toList()
    ..sort((a, b) => b.completedAt!.compareTo(a.completedAt!));

  if (completedAttempts.isEmpty) return 0;

  final now = DateTime.now();
  final lastCompletion = completedAttempts.first.completedAt!;

  if (now.difference(lastCompletion).inHours > 48) return 0;

  int streak = 1;
  for (var i = 0; i < completedAttempts.length - 1; i++) {
    final current = completedAttempts[i].completedAt!;
    final previous = completedAttempts[i + 1].completedAt!;

    if (current.difference(previous).inHours <= 48) {
      streak++;
    } else {
      break;
    }
  }

  return streak;
}
