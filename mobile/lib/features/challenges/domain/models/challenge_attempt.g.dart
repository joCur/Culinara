// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeAttemptImpl _$$ChallengeAttemptImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeAttemptImpl(
      id: json['id'] as String,
      challengeRef: _referenceFromJson(json['challengeRef'] as String),
      userId: json['userId'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      status: $enumDecode(_$ChallengeStatusEnumMap, json['status']),
      completedImageUrl: json['completedImageUrl'] as String?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      feedback: json['feedback'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChallengeAttemptImplToJson(
        _$ChallengeAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'challengeRef': _referenceToJson(instance.challengeRef),
      'userId': instance.userId,
      'startedAt': instance.startedAt.toIso8601String(),
      'status': _$ChallengeStatusEnumMap[instance.status]!,
      'completedImageUrl': instance.completedImageUrl,
      'completedAt': instance.completedAt?.toIso8601String(),
      'feedback': instance.feedback,
      'rating': instance.rating,
    };

const _$ChallengeStatusEnumMap = {
  ChallengeStatus.started: 'started',
  ChallengeStatus.completed: 'completed',
  ChallengeStatus.abandoned: 'abandoned',
};
