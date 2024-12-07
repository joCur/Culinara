// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_reflection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeReflectionImpl _$$ChallengeReflectionImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeReflectionImpl(
      dishName: json['dishName'] as String,
      learnings: json['learnings'] as String,
      difficultyRating: (json['difficultyRating'] as num).toInt(),
      wouldTryAgain: json['wouldTryAgain'] as bool,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timestamp: const TimestampOrStringConverter().fromJson(json['timestamp']),
    );

Map<String, dynamic> _$$ChallengeReflectionImplToJson(
        _$ChallengeReflectionImpl instance) =>
    <String, dynamic>{
      'dishName': instance.dishName,
      'learnings': instance.learnings,
      'difficultyRating': instance.difficultyRating,
      'wouldTryAgain': instance.wouldTryAgain,
      'imageUrls': instance.imageUrls,
      'timestamp':
          const TimestampOrStringConverter().toJson(instance.timestamp),
    };
