// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopicUiState {
  FollowableTopic? get followedTopic => throw _privateConstructorUsedError;
  List<NewsResource> get newsResourcesInTopic =>
      throw _privateConstructorUsedError;
  List<String> get bookmarkedNewsId => throw _privateConstructorUsedError;
  List<String> get followedTopicIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopicUiStateCopyWith<TopicUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicUiStateCopyWith<$Res> {
  factory $TopicUiStateCopyWith(
          TopicUiState value, $Res Function(TopicUiState) then) =
      _$TopicUiStateCopyWithImpl<$Res, TopicUiState>;
  @useResult
  $Res call(
      {FollowableTopic? followedTopic,
      List<NewsResource> newsResourcesInTopic,
      List<String> bookmarkedNewsId,
      List<String> followedTopicIds});

  $FollowableTopicCopyWith<$Res>? get followedTopic;
}

/// @nodoc
class _$TopicUiStateCopyWithImpl<$Res, $Val extends TopicUiState>
    implements $TopicUiStateCopyWith<$Res> {
  _$TopicUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedTopic = freezed,
    Object? newsResourcesInTopic = null,
    Object? bookmarkedNewsId = null,
    Object? followedTopicIds = null,
  }) {
    return _then(_value.copyWith(
      followedTopic: freezed == followedTopic
          ? _value.followedTopic
          : followedTopic // ignore: cast_nullable_to_non_nullable
              as FollowableTopic?,
      newsResourcesInTopic: null == newsResourcesInTopic
          ? _value.newsResourcesInTopic
          : newsResourcesInTopic // ignore: cast_nullable_to_non_nullable
              as List<NewsResource>,
      bookmarkedNewsId: null == bookmarkedNewsId
          ? _value.bookmarkedNewsId
          : bookmarkedNewsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followedTopicIds: null == followedTopicIds
          ? _value.followedTopicIds
          : followedTopicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FollowableTopicCopyWith<$Res>? get followedTopic {
    if (_value.followedTopic == null) {
      return null;
    }

    return $FollowableTopicCopyWith<$Res>(_value.followedTopic!, (value) {
      return _then(_value.copyWith(followedTopic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TopicUiStateCopyWith<$Res>
    implements $TopicUiStateCopyWith<$Res> {
  factory _$$_TopicUiStateCopyWith(
          _$_TopicUiState value, $Res Function(_$_TopicUiState) then) =
      __$$_TopicUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FollowableTopic? followedTopic,
      List<NewsResource> newsResourcesInTopic,
      List<String> bookmarkedNewsId,
      List<String> followedTopicIds});

  @override
  $FollowableTopicCopyWith<$Res>? get followedTopic;
}

/// @nodoc
class __$$_TopicUiStateCopyWithImpl<$Res>
    extends _$TopicUiStateCopyWithImpl<$Res, _$_TopicUiState>
    implements _$$_TopicUiStateCopyWith<$Res> {
  __$$_TopicUiStateCopyWithImpl(
      _$_TopicUiState _value, $Res Function(_$_TopicUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followedTopic = freezed,
    Object? newsResourcesInTopic = null,
    Object? bookmarkedNewsId = null,
    Object? followedTopicIds = null,
  }) {
    return _then(_$_TopicUiState(
      followedTopic: freezed == followedTopic
          ? _value.followedTopic
          : followedTopic // ignore: cast_nullable_to_non_nullable
              as FollowableTopic?,
      newsResourcesInTopic: null == newsResourcesInTopic
          ? _value._newsResourcesInTopic
          : newsResourcesInTopic // ignore: cast_nullable_to_non_nullable
              as List<NewsResource>,
      bookmarkedNewsId: null == bookmarkedNewsId
          ? _value._bookmarkedNewsId
          : bookmarkedNewsId // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followedTopicIds: null == followedTopicIds
          ? _value._followedTopicIds
          : followedTopicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_TopicUiState implements _TopicUiState {
  _$_TopicUiState(
      {this.followedTopic,
      final List<NewsResource> newsResourcesInTopic = const [],
      final List<String> bookmarkedNewsId = const [],
      final List<String> followedTopicIds = const []})
      : _newsResourcesInTopic = newsResourcesInTopic,
        _bookmarkedNewsId = bookmarkedNewsId,
        _followedTopicIds = followedTopicIds;

  @override
  final FollowableTopic? followedTopic;
  final List<NewsResource> _newsResourcesInTopic;
  @override
  @JsonKey()
  List<NewsResource> get newsResourcesInTopic {
    if (_newsResourcesInTopic is EqualUnmodifiableListView)
      return _newsResourcesInTopic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newsResourcesInTopic);
  }

  final List<String> _bookmarkedNewsId;
  @override
  @JsonKey()
  List<String> get bookmarkedNewsId {
    if (_bookmarkedNewsId is EqualUnmodifiableListView)
      return _bookmarkedNewsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarkedNewsId);
  }

  final List<String> _followedTopicIds;
  @override
  @JsonKey()
  List<String> get followedTopicIds {
    if (_followedTopicIds is EqualUnmodifiableListView)
      return _followedTopicIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followedTopicIds);
  }

  @override
  String toString() {
    return 'TopicUiState(followedTopic: $followedTopic, newsResourcesInTopic: $newsResourcesInTopic, bookmarkedNewsId: $bookmarkedNewsId, followedTopicIds: $followedTopicIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopicUiState &&
            (identical(other.followedTopic, followedTopic) ||
                other.followedTopic == followedTopic) &&
            const DeepCollectionEquality()
                .equals(other._newsResourcesInTopic, _newsResourcesInTopic) &&
            const DeepCollectionEquality()
                .equals(other._bookmarkedNewsId, _bookmarkedNewsId) &&
            const DeepCollectionEquality()
                .equals(other._followedTopicIds, _followedTopicIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      followedTopic,
      const DeepCollectionEquality().hash(_newsResourcesInTopic),
      const DeepCollectionEquality().hash(_bookmarkedNewsId),
      const DeepCollectionEquality().hash(_followedTopicIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopicUiStateCopyWith<_$_TopicUiState> get copyWith =>
      __$$_TopicUiStateCopyWithImpl<_$_TopicUiState>(this, _$identity);
}

abstract class _TopicUiState implements TopicUiState {
  factory _TopicUiState(
      {final FollowableTopic? followedTopic,
      final List<NewsResource> newsResourcesInTopic,
      final List<String> bookmarkedNewsId,
      final List<String> followedTopicIds}) = _$_TopicUiState;

  @override
  FollowableTopic? get followedTopic;
  @override
  List<NewsResource> get newsResourcesInTopic;
  @override
  List<String> get bookmarkedNewsId;
  @override
  List<String> get followedTopicIds;
  @override
  @JsonKey(ignore: true)
  _$$_TopicUiStateCopyWith<_$_TopicUiState> get copyWith =>
      throw _privateConstructorUsedError;
}
