import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/challenge_attempt.dart';

final challengeTemplateStatsProvider = StreamProvider.family
    .autoDispose<ChallengeTemplateStats, String>((ref, String templateId) {
  return FirebaseFirestore.instance
      .collection('challengeAttempts')
      .where('templateId', isEqualTo: templateId)
      .snapshots()
      .map((snapshot) {
    final attempts = snapshot.docs
        .map((doc) => ChallengeAttempt.fromFirestore(doc, null))
        .toList();

    return ChallengeTemplateStats(
      timesAttempted: attempts.length,
      timesCompleted:
          attempts.where((a) => a.status == ChallengeStatus.completed).length,
      averageDifficulty: _calculateAverageDifficulty(attempts),
    );
  });
});

class ChallengeTemplateStats {
  final int timesAttempted;
  final int timesCompleted;
  final double? averageDifficulty;

  const ChallengeTemplateStats({
    required this.timesAttempted,
    required this.timesCompleted,
    this.averageDifficulty,
  });
}

double? _calculateAverageDifficulty(List<ChallengeAttempt> attempts) {
  final completedWithReflection = attempts.where(
      (a) => a.status == ChallengeStatus.completed && a.reflection != null);

  if (completedWithReflection.isEmpty) return null;

  final sum = completedWithReflection
      .map((a) => a.reflection!.difficultyRating)
      .reduce((value, element) => value + element);

  return sum / completedWithReflection.length;
}
