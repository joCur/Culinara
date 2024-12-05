// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeAttemptImpl _$$ChallengeAttemptImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeAttemptImpl(
      id: json['id'] as String,
      challengeId: json['challengeId'] as String,
      userId: json['userId'] as String,
      startedAt: DateTime.parse(json['startedAt'] as String),
      status: $enumDecode(_$ChallengeStatusEnumMap, json['status']),
      completedImageUrl: json['completedImageUrl'] as String?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      feedback: json['feedback'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      likedByUsers: (json['likedByUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => ChallengeComment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChallengeAttemptImplToJson(
        _$ChallengeAttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'challengeId': instance.challengeId,
      'userId': instance.userId,
      'startedAt': instance.startedAt.toIso8601String(),
      'status': _$ChallengeStatusEnumMap[instance.status]!,
      'completedImageUrl': instance.completedImageUrl,
      'completedAt': instance.completedAt?.toIso8601String(),
      'feedback': instance.feedback,
      'rating': instance.rating,
      'likedByUsers': instance.likedByUsers,
      'comments': instance.comments,
    };

const _$ChallengeStatusEnumMap = {
  ChallengeStatus.started: 'started',
  ChallengeStatus.completed: 'completed',
  ChallengeStatus.abandoned: 'abandoned',
};

_$ChallengeCommentImpl _$$ChallengeCommentImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeCommentImpl(
      userId: json['userId'] as String,
      text: json['text'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ChallengeCommentImplToJson(
        _$ChallengeCommentImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'text': instance.text,
      'createdAt': instance.createdAt.toIso8601String(),
    };
