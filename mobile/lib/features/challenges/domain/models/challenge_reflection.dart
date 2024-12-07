import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json_converters/timestamp_converter.dart';

part 'challenge_reflection.freezed.dart';
part 'challenge_reflection.g.dart';

@freezed
class ChallengeReflection with _$ChallengeReflection {
  const factory ChallengeReflection({
    required String dishName,
    required String learnings,
    required int difficultyRating,
    required bool wouldTryAgain,
    List<String>? imageUrls,
    @TimestampOrStringConverter() required DateTime timestamp,
  }) = _ChallengeReflection;

  factory ChallengeReflection.fromJson(Map<String, dynamic> json) =>
      _$ChallengeReflectionFromJson(json);
}
