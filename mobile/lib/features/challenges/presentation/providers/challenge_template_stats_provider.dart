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
      averageRating: _calculateAverageRating(attempts),
    );
  });
});

class ChallengeTemplateStats {
  final int timesAttempted;
  final int timesCompleted;
  final double? averageRating;

  const ChallengeTemplateStats({
    required this.timesAttempted,
    required this.timesCompleted,
    this.averageRating,
  });
}

double? _calculateAverageRating(List<ChallengeAttempt> attempts) {
  final completedWithRating = attempts
      .where((a) => a.status == ChallengeStatus.completed && a.rating != null);

  if (completedWithRating.isEmpty) return null;

  final sum = completedWithRating
      .map((a) => a.rating!)
      .reduce((value, element) => value + element);

  return sum / completedWithRating.length;
}
