// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_resource_topic_corss_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsResourceTopicCrossRef _$NewsResourceTopicCrossRefFromJson(
    Map<String, dynamic> json) {
  return _NewsResourceTopicCrossRef.fromJson(json);
}

/// @nodoc
mixin _$NewsResourceTopicCrossRef {
  @JsonKey(name: "news_resource_id")
  String get newsResourceId => throw _privateConstructorUsedError;
  @JsonKey(name: "topic_id")
  String get topicId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsResourceTopicCrossRefCopyWith<NewsResourceTopicCrossRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsResourceTopicCrossRefCopyWith<$Res> {
  factory $NewsResourceTopicCrossRefCopyWith(NewsResourceTopicCrossRef value,
          $Res Function(NewsResourceTopicCrossRef) then) =
      _$NewsResourceTopicCrossRefCopyWithImpl<$Res, NewsResourceTopicCrossRef>;
  @useResult
  $Res call(
      {@JsonKey(name: "news_resource_id") String newsResourceId,
      @JsonKey(name: "topic_id") String topicId});
}

/// @nodoc
class _$NewsResourceTopicCrossRefCopyWithImpl<$Res,
        $Val extends NewsResourceTopicCrossRef>
    implements $NewsResourceTopicCrossRefCopyWith<$Res> {
  _$NewsResourceTopicCrossRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsResourceId = null,
    Object? topicId = null,
  }) {
    return _then(_value.copyWith(
      newsResourceId: null == newsResourceId
          ? _value.newsResourceId
          : newsResourceId // ignore: cast_nullable_to_non_nullable
              as String,
      topicId: null == topicId
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsResourceTopicCrossRefCopyWith<$Res>
    implements $NewsResourceTopicCrossRefCopyWith<$Res> {
  factory _$$_NewsResourceTopicCrossRefCopyWith(
          _$_NewsResourceTopicCrossRef value,
          $Res Function(_$_NewsResourceTopicCrossRef) then) =
      __$$_NewsResourceTopicCrossRefCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "news_resource_id") String newsResourceId,
      @JsonKey(name: "topic_id") String topicId});
}

/// @nodoc
class __$$_NewsResourceTopicCrossRefCopyWithImpl<$Res>
    extends _$NewsResourceTopicCrossRefCopyWithImpl<$Res,
        _$_NewsResourceTopicCrossRef>
    implements _$$_NewsResourceTopicCrossRefCopyWith<$Res> {
  __$$_NewsResourceTopicCrossRefCopyWithImpl(
      _$_NewsResourceTopicCrossRef _value,
      $Res Function(_$_NewsResourceTopicCrossRef) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsResourceId = null,
    Object? topicId = null,
  }) {
    return _then(_$_NewsResourceTopicCrossRef(
      newsResourceId: null == newsResourceId
          ? _value.newsResourceId
          : newsResourceId // ignore: cast_nullable_to_non_nullable
              as String,
      topicId: null == topicId
          ? _value.topicId
          : topicId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsResourceTopicCrossRef implements _NewsResourceTopicCrossRef {
  _$_NewsResourceTopicCrossRef(
      {@JsonKey(name: "news_resource_id") required this.newsResourceId,
      @JsonKey(name: "topic_id") required this.topicId});

  factory _$_NewsResourceTopicCrossRef.fromJson(Map<String, dynamic> json) =>
      _$$_NewsResourceTopicCrossRefFromJson(json);

  @override
  @JsonKey(name: "news_resource_id")
  final String newsResourceId;
  @override
  @JsonKey(name: "topic_id")
  final String topicId;

  @override
  String toString() {
    return 'NewsResourceTopicCrossRef(newsResourceId: $newsResourceId, topicId: $topicId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsResourceTopicCrossRef &&
            (identical(other.newsResourceId, newsResourceId) ||
                other.newsResourceId == newsResourceId) &&
            (identical(other.topicId, topicId) || other.topicId == topicId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, newsResourceId, topicId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsResourceTopicCrossRefCopyWith<_$_NewsResourceTopicCrossRef>
      get copyWith => __$$_NewsResourceTopicCrossRefCopyWithImpl<
          _$_NewsResourceTopicCrossRef>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsResourceTopicCrossRefToJson(
      this,
    );
  }
}

abstract class _NewsResourceTopicCrossRef implements NewsResourceTopicCrossRef {
  factory _NewsResourceTopicCrossRef(
      {@JsonKey(name: "news_resource_id") required final String newsResourceId,
      @JsonKey(name: "topic_id")
      required final String topicId}) = _$_NewsResourceTopicCrossRef;

  factory _NewsResourceTopicCrossRef.fromJson(Map<String, dynamic> json) =
      _$_NewsResourceTopicCrossRef.fromJson;

  @override
  @JsonKey(name: "news_resource_id")
  String get newsResourceId;
  @override
  @JsonKey(name: "topic_id")
  String get topicId;
  @override
  @JsonKey(ignore: true)
  _$$_NewsResourceTopicCrossRefCopyWith<_$_NewsResourceTopicCrossRef>
      get copyWith => throw _privateConstructorUsedError;
}
