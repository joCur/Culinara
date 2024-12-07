// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeAttemptImpl _$$ChallengeAttemptImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeAttemptImpl(
      id: json['id'] as String,
      challengeRef:
          const DocumentReferenceConverter().fromJson(json['challengeRef']),
      userId: json['userId'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      status: $enumDecode(_$ChallengeStatusEnumMap, json['status']),
      completedImageUrl: json['completedImageUrl'] as String?,
      completedAt: const NullableTimestampOrStringConverter()
          .fromJson(json['completedAt']),
      reflection: json['reflection'] == null
          ? null
          : ChallengeReflection.fromJson(
              json['reflection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChallengeAttemptImplToJson(
        _$ChallengeAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'challengeRef':
          const DocumentReferenceConverter().toJson(instance.challengeRef),
      'userId': instance.userId,
      'startedAt': instance.startedAt.toIso8601String(),
      'status': _$ChallengeStatusEnumMap[instance.status]!,
      'completedImageUrl': instance.completedImageUrl,
      'completedAt': const NullableTimestampOrStringConverter()
          .toJson(instance.completedAt),
      'reflection': instance.reflection,
    };

const _$ChallengeStatusEnumMap = {
  ChallengeStatus.started: 'started',
  ChallengeStatus.completed: 'completed',
  ChallengeStatus.failed: 'failed',
};
