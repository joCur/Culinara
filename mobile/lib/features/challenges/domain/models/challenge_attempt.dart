import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'challenge_attempt.freezed.dart';
part 'challenge_attempt.g.dart';

@freezed
class ChallengeAttempt with _$ChallengeAttempt {
  const factory ChallengeAttempt({
    required String id,
    @JsonKey(fromJson: _referenceFromJson, toJson: _referenceToJson)
    required DocumentReference<Map<String, dynamic>> challengeRef,
    required String userId,
    required DateTime startedAt,
    required ChallengeStatus status,
    String? completedImageUrl,
    DateTime? completedAt,
    String? feedback,
    int? rating,
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

DocumentReference<Map<String, dynamic>> _referenceFromJson(String path) {
  return FirebaseFirestore.instance.doc(path);
}

String _referenceToJson(DocumentReference<Map<String, dynamic>> reference) {
  return reference.path;
}

enum ChallengeStatus { started, completed, abandoned }
