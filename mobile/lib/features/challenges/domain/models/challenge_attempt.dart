import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'challenge_attempt.freezed.dart';
part 'challenge_attempt.g.dart';

@freezed
class ChallengeAttempt with _$ChallengeAttempt {
  const factory ChallengeAttempt({
    required String id,
    required String challengeId,
    required String userId,
    required DateTime startedAt,
    required ChallengeStatus status,
    String? completedImageUrl,
    DateTime? completedAt,
    String? feedback,
    int? rating,
    @Default([]) List<String> likedByUsers,
    @Default([]) List<ChallengeComment> comments,
  }) = _ChallengeAttempt;

  factory ChallengeAttempt.fromJson(Map<String, dynamic> json) =>
      _$ChallengeAttemptFromJson(json);

  factory ChallengeAttempt.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return ChallengeAttempt.fromJson({
      ...data,
      'id': snapshot.id,
    });
  }
}

@freezed
class ChallengeComment with _$ChallengeComment {
  const factory ChallengeComment({
    required String userId,
    required String text,
    required DateTime createdAt,
  }) = _ChallengeComment;

  factory ChallengeComment.fromJson(Map<String, dynamic> json) =>
      _$ChallengeCommentFromJson(json);
}

enum ChallengeStatus { started, completed, abandoned }
