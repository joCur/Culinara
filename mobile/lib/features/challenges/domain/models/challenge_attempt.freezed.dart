// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeAttempt _$ChallengeAttemptFromJson(Map<String, dynamic> json) {
  return _ChallengeAttempt.fromJson(json);
}

/// @nodoc
mixin _$ChallengeAttempt {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _referenceFromJson, toJson: _referenceToJson)
  DocumentReference<Map<String, dynamic>> get challengeRef =>
      throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  ChallengeStatus get status => throw _privateConstructorUsedError;
  String? get completedImageUrl => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get feedback => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;

  /// Serializes this ChallengeAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeAttemptCopyWith<ChallengeAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeAttemptCopyWith<$Res> {
  factory $ChallengeAttemptCopyWith(
          ChallengeAttempt value, $Res Function(ChallengeAttempt) then) =
      _$ChallengeAttemptCopyWithImpl<$Res, ChallengeAttempt>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(fromJson: _referenceFromJson, toJson: _referenceToJson)
      DocumentReference<Map<String, dynamic>> challengeRef,
      String userId,
      DateTime startedAt,
      ChallengeStatus status,
      String? completedImageUrl,
      DateTime? completedAt,
      String? feedback,
      int? rating});
}

/// @nodoc
class _$ChallengeAttemptCopyWithImpl<$Res, $Val extends ChallengeAttempt>
    implements $ChallengeAttemptCopyWith<$Res> {
  _$ChallengeAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? challengeRef = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? status = null,
    Object? completedImageUrl = freezed,
    Object? completedAt = freezed,
    Object? feedback = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      challengeRef: null == challengeRef
          ? _value.challengeRef
          : challengeRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Map<String, dynamic>>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChallengeStatus,
      completedImageUrl: freezed == completedImageUrl
          ? _value.completedImageUrl
          : completedImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeAttemptImplCopyWith<$Res>
    implements $ChallengeAttemptCopyWith<$Res> {
  factory _$$ChallengeAttemptImplCopyWith(_$ChallengeAttemptImpl value,
          $Res Function(_$ChallengeAttemptImpl) then) =
      __$$ChallengeAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(fromJson: _referenceFromJson, toJson: _referenceToJson)
      DocumentReference<Map<String, dynamic>> challengeRef,
      String userId,
      DateTime startedAt,
      ChallengeStatus status,
      String? completedImageUrl,
      DateTime? completedAt,
      String? feedback,
      int? rating});
}

/// @nodoc
class __$$ChallengeAttemptImplCopyWithImpl<$Res>
    extends _$ChallengeAttemptCopyWithImpl<$Res, _$ChallengeAttemptImpl>
    implements _$$ChallengeAttemptImplCopyWith<$Res> {
  __$$ChallengeAttemptImplCopyWithImpl(_$ChallengeAttemptImpl _value,
      $Res Function(_$ChallengeAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? challengeRef = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? status = null,
    Object? completedImageUrl = freezed,
    Object? completedAt = freezed,
    Object? feedback = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$ChallengeAttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      challengeRef: null == challengeRef
          ? _value.challengeRef
          : challengeRef // ignore: cast_nullable_to_non_nullable
              as DocumentReference<Map<String, dynamic>>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ChallengeStatus,
      completedImageUrl: freezed == completedImageUrl
          ? _value.completedImageUrl
          : completedImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeAttemptImpl implements _ChallengeAttempt {
  const _$ChallengeAttemptImpl(
      {required this.id,
      @JsonKey(fromJson: _referenceFromJson, toJson: _referenceToJson)
      required this.challengeRef,
      required this.userId,
      required this.startedAt,
      required this.status,
      this.completedImageUrl,
      this.completedAt,
      this.feedback,
      this.rating});

  factory _$ChallengeAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeAttemptImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(fromJson: _referenceFromJson, toJson: _referenceToJson)
  final DocumentReference<Map<String, dynamic>> challengeRef;
  @override
  final String userId;
  @override
  final DateTime startedAt;
  @override
  final ChallengeStatus status;
  @override
  final String? completedImageUrl;
  @override
  final DateTime? completedAt;
  @override
  final String? feedback;
  @override
  final int? rating;

  @override
  String toString() {
    return 'ChallengeAttempt(id: $id, challengeRef: $challengeRef, userId: $userId, startedAt: $startedAt, status: $status, completedImageUrl: $completedImageUrl, completedAt: $completedAt, feedback: $feedback, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeAttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.challengeRef, challengeRef) ||
                other.challengeRef == challengeRef) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.completedImageUrl, completedImageUrl) ||
                other.completedImageUrl == completedImageUrl) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, challengeRef, userId,
      startedAt, status, completedImageUrl, completedAt, feedback, rating);

  /// Create a copy of ChallengeAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeAttemptImplCopyWith<_$ChallengeAttemptImpl> get copyWith =>
      __$$ChallengeAttemptImplCopyWithImpl<_$ChallengeAttemptImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeAttemptImplToJson(
      this,
    );
  }
}

abstract class _ChallengeAttempt implements ChallengeAttempt {
  const factory _ChallengeAttempt(
      {required final String id,
      @JsonKey(fromJson: _referenceFromJson, toJson: _referenceToJson)
      required final DocumentReference<Map<String, dynamic>> challengeRef,
      required final String userId,
      required final DateTime startedAt,
      required final ChallengeStatus status,
      final String? completedImageUrl,
      final DateTime? completedAt,
      final String? feedback,
      final int? rating}) = _$ChallengeAttemptImpl;

  factory _ChallengeAttempt.fromJson(Map<String, dynamic> json) =
      _$ChallengeAttemptImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(fromJson: _referenceFromJson, toJson: _referenceToJson)
  DocumentReference<Map<String, dynamic>> get challengeRef;
  @override
  String get userId;
  @override
  DateTime get startedAt;
  @override
  ChallengeStatus get status;
  @override
  String? get completedImageUrl;
  @override
  DateTime? get completedAt;
  @override
  String? get feedback;
  @override
  int? get rating;

  /// Create a copy of ChallengeAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeAttemptImplCopyWith<_$ChallengeAttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
