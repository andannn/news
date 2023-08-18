// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followable_topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FollowableTopic {
  Topic get topic => throw _privateConstructorUsedError;
  bool get isFollowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowableTopicCopyWith<FollowableTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowableTopicCopyWith<$Res> {
  factory $FollowableTopicCopyWith(
          FollowableTopic value, $Res Function(FollowableTopic) then) =
      _$FollowableTopicCopyWithImpl<$Res, FollowableTopic>;
  @useResult
  $Res call({Topic topic, bool isFollowed});

  $TopicCopyWith<$Res> get topic;
}

/// @nodoc
class _$FollowableTopicCopyWithImpl<$Res, $Val extends FollowableTopic>
    implements $FollowableTopicCopyWith<$Res> {
  _$FollowableTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? isFollowed = null,
  }) {
    return _then(_value.copyWith(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic,
      isFollowed: null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TopicCopyWith<$Res> get topic {
    return $TopicCopyWith<$Res>(_value.topic, (value) {
      return _then(_value.copyWith(topic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FollowableTopicCopyWith<$Res>
    implements $FollowableTopicCopyWith<$Res> {
  factory _$$_FollowableTopicCopyWith(
          _$_FollowableTopic value, $Res Function(_$_FollowableTopic) then) =
      __$$_FollowableTopicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Topic topic, bool isFollowed});

  @override
  $TopicCopyWith<$Res> get topic;
}

/// @nodoc
class __$$_FollowableTopicCopyWithImpl<$Res>
    extends _$FollowableTopicCopyWithImpl<$Res, _$_FollowableTopic>
    implements _$$_FollowableTopicCopyWith<$Res> {
  __$$_FollowableTopicCopyWithImpl(
      _$_FollowableTopic _value, $Res Function(_$_FollowableTopic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? isFollowed = null,
  }) {
    return _then(_$_FollowableTopic(
      null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as Topic,
      null == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FollowableTopic implements _FollowableTopic {
  _$_FollowableTopic(this.topic, this.isFollowed);

  @override
  final Topic topic;
  @override
  final bool isFollowed;

  @override
  String toString() {
    return 'FollowableTopic(topic: $topic, isFollowed: $isFollowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FollowableTopic &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topic, isFollowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FollowableTopicCopyWith<_$_FollowableTopic> get copyWith =>
      __$$_FollowableTopicCopyWithImpl<_$_FollowableTopic>(this, _$identity);
}

abstract class _FollowableTopic implements FollowableTopic {
  factory _FollowableTopic(final Topic topic, final bool isFollowed) =
      _$_FollowableTopic;

  @override
  Topic get topic;
  @override
  bool get isFollowed;
  @override
  @JsonKey(ignore: true)
  _$$_FollowableTopicCopyWith<_$_FollowableTopic> get copyWith =>
      throw _privateConstructorUsedError;
}
