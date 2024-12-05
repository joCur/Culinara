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
  String get challengeId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  ChallengeStatus get status => throw _privateConstructorUsedError;
  String? get completedImageUrl => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get feedback => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  List<String> get likedByUsers => throw _privateConstructorUsedError;
  List<ChallengeComment> get comments => throw _privateConstructorUsedError;

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
      String challengeId,
      String userId,
      DateTime startedAt,
      ChallengeStatus status,
      String? completedImageUrl,
      DateTime? completedAt,
      String? feedback,
      int? rating,
      List<String> likedByUsers,
      List<ChallengeComment> comments});
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
    Object? challengeId = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? status = null,
    Object? completedImageUrl = freezed,
    Object? completedAt = freezed,
    Object? feedback = freezed,
    Object? rating = freezed,
    Object? likedByUsers = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String,
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
      likedByUsers: null == likedByUsers
          ? _value.likedByUsers
          : likedByUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ChallengeComment>,
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
      String challengeId,
      String userId,
      DateTime startedAt,
      ChallengeStatus status,
      String? completedImageUrl,
      DateTime? completedAt,
      String? feedback,
      int? rating,
      List<String> likedByUsers,
      List<ChallengeComment> comments});
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
    Object? challengeId = null,
    Object? userId = null,
    Object? startedAt = null,
    Object? status = null,
    Object? completedImageUrl = freezed,
    Object? completedAt = freezed,
    Object? feedback = freezed,
    Object? rating = freezed,
    Object? likedByUsers = null,
    Object? comments = null,
  }) {
    return _then(_$ChallengeAttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as String,
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
      likedByUsers: null == likedByUsers
          ? _value._likedByUsers
          : likedByUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<ChallengeComment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeAttemptImpl implements _ChallengeAttempt {
  const _$ChallengeAttemptImpl(
      {required this.id,
      required this.challengeId,
      required this.userId,
      required this.startedAt,
      required this.status,
      this.completedImageUrl,
      this.completedAt,
      this.feedback,
      this.rating,
      final List<String> likedByUsers = const [],
      final List<ChallengeComment> comments = const []})
      : _likedByUsers = likedByUsers,
        _comments = comments;

  factory _$ChallengeAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeAttemptImplFromJson(json);

  @override
  final String id;
  @override
  final String challengeId;
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
  final List<String> _likedByUsers;
  @override
  @JsonKey()
  List<String> get likedByUsers {
    if (_likedByUsers is EqualUnmodifiableListView) return _likedByUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedByUsers);
  }

  final List<ChallengeComment> _comments;
  @override
  @JsonKey()
  List<ChallengeComment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'ChallengeAttempt(id: $id, challengeId: $challengeId, userId: $userId, startedAt: $startedAt, status: $status, completedImageUrl: $completedImageUrl, completedAt: $completedAt, feedback: $feedback, rating: $rating, likedByUsers: $likedByUsers, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeAttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
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
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._likedByUsers, _likedByUsers) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      challengeId,
      userId,
      startedAt,
      status,
      completedImageUrl,
      completedAt,
      feedback,
      rating,
      const DeepCollectionEquality().hash(_likedByUsers),
      const DeepCollectionEquality().hash(_comments));

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
      required final String challengeId,
      required final String userId,
      required final DateTime startedAt,
      required final ChallengeStatus status,
      final String? completedImageUrl,
      final DateTime? completedAt,
      final String? feedback,
      final int? rating,
      final List<String> likedByUsers,
      final List<ChallengeComment> comments}) = _$ChallengeAttemptImpl;

  factory _ChallengeAttempt.fromJson(Map<String, dynamic> json) =
      _$ChallengeAttemptImpl.fromJson;

  @override
  String get id;
  @override
  String get challengeId;
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
  @override
  List<String> get likedByUsers;
  @override
  List<ChallengeComment> get comments;

  /// Create a copy of ChallengeAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeAttemptImplCopyWith<_$ChallengeAttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChallengeComment _$ChallengeCommentFromJson(Map<String, dynamic> json) {
  return _ChallengeComment.fromJson(json);
}

/// @nodoc
mixin _$ChallengeComment {
  String get userId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ChallengeComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeCommentCopyWith<ChallengeComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeCommentCopyWith<$Res> {
  factory $ChallengeCommentCopyWith(
          ChallengeComment value, $Res Function(ChallengeComment) then) =
      _$ChallengeCommentCopyWithImpl<$Res, ChallengeComment>;
  @useResult
  $Res call({String userId, String text, DateTime createdAt});
}

/// @nodoc
class _$ChallengeCommentCopyWithImpl<$Res, $Val extends ChallengeComment>
    implements $ChallengeCommentCopyWith<$Res> {
  _$ChallengeCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? text = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeCommentImplCopyWith<$Res>
    implements $ChallengeCommentCopyWith<$Res> {
  factory _$$ChallengeCommentImplCopyWith(_$ChallengeCommentImpl value,
          $Res Function(_$ChallengeCommentImpl) then) =
      __$$ChallengeCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String text, DateTime createdAt});
}

/// @nodoc
class __$$ChallengeCommentImplCopyWithImpl<$Res>
    extends _$ChallengeCommentCopyWithImpl<$Res, _$ChallengeCommentImpl>
    implements _$$ChallengeCommentImplCopyWith<$Res> {
  __$$ChallengeCommentImplCopyWithImpl(_$ChallengeCommentImpl _value,
      $Res Function(_$ChallengeCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? text = null,
    Object? createdAt = null,
  }) {
    return _then(_$ChallengeCommentImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeCommentImpl implements _ChallengeComment {
  const _$ChallengeCommentImpl(
      {required this.userId, required this.text, required this.createdAt});

  factory _$ChallengeCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeCommentImplFromJson(json);

  @override
  final String userId;
  @override
  final String text;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ChallengeComment(userId: $userId, text: $text, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeCommentImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, text, createdAt);

  /// Create a copy of ChallengeComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeCommentImplCopyWith<_$ChallengeCommentImpl> get copyWith =>
      __$$ChallengeCommentImplCopyWithImpl<_$ChallengeCommentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeCommentImplToJson(
      this,
    );
  }
}

abstract class _ChallengeComment implements ChallengeComment {
  const factory _ChallengeComment(
      {required final String userId,
      required final String text,
      required final DateTime createdAt}) = _$ChallengeCommentImpl;

  factory _ChallengeComment.fromJson(Map<String, dynamic> json) =
      _$ChallengeCommentImpl.fromJson;

  @override
  String get userId;
  @override
  String get text;
  @override
  DateTime get createdAt;

  /// Create a copy of ChallengeComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeCommentImplCopyWith<_$ChallengeCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
