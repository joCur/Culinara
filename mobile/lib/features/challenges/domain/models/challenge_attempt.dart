import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/json_converters/timestamp_converter.dart';
import '../../../../core/json_converters/document_reference_converter.dart';
import 'challenge_reflection.dart';

part 'challenge_attempt.freezed.dart';
part 'challenge_attempt.g.dart';

enum ChallengeStatus { started, completed, failed }

@freezed
class ChallengeAttempt with _$ChallengeAttempt {
  const ChallengeAttempt._();

  const factory ChallengeAttempt({
    required String id,
    @DocumentReferenceConverter()
    required DocumentReference<Map<String, dynamic>> challengeRef,
    required String userId,
    @NullableTimestampOrStringConverter() required DateTime startedAt,
    required ChallengeStatus status,
    String? completedImageUrl,
    @NullableTimestampOrStringConverter() DateTime? completedAt,
    ChallengeReflection? reflection,
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
      'challengeRef': data['challengeRef'],
    });
  }
}
