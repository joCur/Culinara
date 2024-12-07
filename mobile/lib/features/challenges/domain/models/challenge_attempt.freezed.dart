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
  @DocumentReferenceConverter()
  DocumentReference<Map<String, dynamic>> get challengeRef =>
      throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @NullableTimestampOrStringConverter()
  DateTime get startedAt => throw _privateConstructorUsedError;
  ChallengeStatus get status => throw _privateConstructorUsedError;
  String? get completedImageUrl => throw _privateConstructorUsedError;
  @NullableTimestampOrStringConverter()
  DateTime? get completedAt => throw _privateConstructorUsedError;
  ChallengeReflection? get reflection => throw _privateConstructorUsedError;

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
      @DocumentReferenceConverter()
      DocumentReference<Map<String, dynamic>> challengeRef,
      String userId,
      @NullableTimestampOrStringConverter() DateTime startedAt,
      ChallengeStatus status,
      String? completedImageUrl,
      @NullableTimestampOrStringConverter() DateTime? completedAt,
      ChallengeReflection? reflection});

  $ChallengeReflectionCopyWith<$Res>? get reflection;
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
    Object? reflection = freezed,
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
      reflection: freezed == reflection
          ? _value.reflection
          : reflection // ignore: cast_nullable_to_non_nullable
              as ChallengeReflection?,
    ) as $Val);
  }

  /// Create a copy of ChallengeAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChallengeReflectionCopyWith<$Res>? get reflection {
    if (_value.reflection == null) {
      return null;
    }

    return $ChallengeReflectionCopyWith<$Res>(_value.reflection!, (value) {
      return _then(_value.copyWith(reflection: value) as $Val);
    });
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
      @DocumentReferenceConverter()
      DocumentReference<Map<String, dynamic>> challengeRef,
      String userId,
      @NullableTimestampOrStringConverter() DateTime startedAt,
      ChallengeStatus status,
      String? completedImageUrl,
      @NullableTimestampOrStringConverter() DateTime? completedAt,
      ChallengeReflection? reflection});

  @override
  $ChallengeReflectionCopyWith<$Res>? get reflection;
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
    Object? reflection = freezed,
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
      reflection: freezed == reflection
          ? _value.reflection
          : reflection // ignore: cast_nullable_to_non_nullable
              as ChallengeReflection?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeAttemptImpl extends _ChallengeAttempt {
  const _$ChallengeAttemptImpl(
      {required this.id,
      @DocumentReferenceConverter() required this.challengeRef,
      required this.userId,
      @NullableTimestampOrStringConverter() required this.startedAt,
      required this.status,
      this.completedImageUrl,
      @NullableTimestampOrStringConverter() this.completedAt,
      this.reflection})
      : super._();

  factory _$ChallengeAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeAttemptImplFromJson(json);

  @override
  final String id;
  @override
  @DocumentReferenceConverter()
  final DocumentReference<Map<String, dynamic>> challengeRef;
  @override
  final String userId;
  @override
  @NullableTimestampOrStringConverter()
  final DateTime startedAt;
  @override
  final ChallengeStatus status;
  @override
  final String? completedImageUrl;
  @override
  @NullableTimestampOrStringConverter()
  final DateTime? completedAt;
  @override
  final ChallengeReflection? reflection;

  @override
  String toString() {
    return 'ChallengeAttempt(id: $id, challengeRef: $challengeRef, userId: $userId, startedAt: $startedAt, status: $status, completedImageUrl: $completedImageUrl, completedAt: $completedAt, reflection: $reflection)';
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
            (identical(other.reflection, reflection) ||
                other.reflection == reflection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, challengeRef, userId,
      startedAt, status, completedImageUrl, completedAt, reflection);

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

abstract class _ChallengeAttempt extends ChallengeAttempt {
  const factory _ChallengeAttempt(
      {required final String id,
      @DocumentReferenceConverter()
      required final DocumentReference<Map<String, dynamic>> challengeRef,
      required final String userId,
      @NullableTimestampOrStringConverter() required final DateTime startedAt,
      required final ChallengeStatus status,
      final String? completedImageUrl,
      @NullableTimestampOrStringConverter() final DateTime? completedAt,
      final ChallengeReflection? reflection}) = _$ChallengeAttemptImpl;
  const _ChallengeAttempt._() : super._();

  factory _ChallengeAttempt.fromJson(Map<String, dynamic> json) =
      _$ChallengeAttemptImpl.fromJson;

  @override
  String get id;
  @override
  @DocumentReferenceConverter()
  DocumentReference<Map<String, dynamic>> get challengeRef;
  @override
  String get userId;
  @override
  @NullableTimestampOrStringConverter()
  DateTime get startedAt;
  @override
  ChallengeStatus get status;
  @override
  String? get completedImageUrl;
  @override
  @NullableTimestampOrStringConverter()
  DateTime? get completedAt;
  @override
  ChallengeReflection? get reflection;

  /// Create a copy of ChallengeAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeAttemptImplCopyWith<_$ChallengeAttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
