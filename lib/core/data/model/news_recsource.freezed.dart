// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_recsource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewsResource {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get headerImageUrl => throw _privateConstructorUsedError;
  DateTime? get publishDate => throw _privateConstructorUsedError;
  NewsResourceType get type => throw _privateConstructorUsedError;
  List<Topic> get topics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsResourceCopyWith<NewsResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsResourceCopyWith<$Res> {
  factory $NewsResourceCopyWith(
          NewsResource value, $Res Function(NewsResource) then) =
      _$NewsResourceCopyWithImpl<$Res, NewsResource>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String url,
      String? headerImageUrl,
      DateTime? publishDate,
      NewsResourceType type,
      List<Topic> topics});
}

/// @nodoc
class _$NewsResourceCopyWithImpl<$Res, $Val extends NewsResource>
    implements $NewsResourceCopyWith<$Res> {
  _$NewsResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? url = null,
    Object? headerImageUrl = freezed,
    Object? publishDate = freezed,
    Object? type = null,
    Object? topics = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      headerImageUrl: freezed == headerImageUrl
          ? _value.headerImageUrl
          : headerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NewsResourceType,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsResourceCopyWith<$Res>
    implements $NewsResourceCopyWith<$Res> {
  factory _$$_NewsResourceCopyWith(
          _$_NewsResource value, $Res Function(_$_NewsResource) then) =
      __$$_NewsResourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String url,
      String? headerImageUrl,
      DateTime? publishDate,
      NewsResourceType type,
      List<Topic> topics});
}

/// @nodoc
class __$$_NewsResourceCopyWithImpl<$Res>
    extends _$NewsResourceCopyWithImpl<$Res, _$_NewsResource>
    implements _$$_NewsResourceCopyWith<$Res> {
  __$$_NewsResourceCopyWithImpl(
      _$_NewsResource _value, $Res Function(_$_NewsResource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? url = null,
    Object? headerImageUrl = freezed,
    Object? publishDate = freezed,
    Object? type = null,
    Object? topics = null,
  }) {
    return _then(_$_NewsResource(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      headerImageUrl: freezed == headerImageUrl
          ? _value.headerImageUrl
          : headerImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NewsResourceType,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
    ));
  }
}

/// @nodoc

class _$_NewsResource implements _NewsResource {
  _$_NewsResource(
      {required this.id,
      this.title = '',
      this.content = '',
      this.url = '',
      this.headerImageUrl,
      this.publishDate,
      this.type = NewsResourceType.unknown,
      final List<Topic> topics = const []})
      : _topics = topics;

  @override
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String url;
  @override
  final String? headerImageUrl;
  @override
  final DateTime? publishDate;
  @override
  @JsonKey()
  final NewsResourceType type;
  final List<Topic> _topics;
  @override
  @JsonKey()
  List<Topic> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'NewsResource(id: $id, title: $title, content: $content, url: $url, headerImageUrl: $headerImageUrl, publishDate: $publishDate, type: $type, topics: $topics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsResource &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.headerImageUrl, headerImageUrl) ||
                other.headerImageUrl == headerImageUrl) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      url,
      headerImageUrl,
      publishDate,
      type,
      const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsResourceCopyWith<_$_NewsResource> get copyWith =>
      __$$_NewsResourceCopyWithImpl<_$_NewsResource>(this, _$identity);
}

abstract class _NewsResource implements NewsResource {
  factory _NewsResource(
      {required final String id,
      final String title,
      final String content,
      final String url,
      final String? headerImageUrl,
      final DateTime? publishDate,
      final NewsResourceType type,
      final List<Topic> topics}) = _$_NewsResource;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get url;
  @override
  String? get headerImageUrl;
  @override
  DateTime? get publishDate;
  @override
  NewsResourceType get type;
  @override
  List<Topic> get topics;
  @override
  @JsonKey(ignore: true)
  _$$_NewsResourceCopyWith<_$_NewsResource> get copyWith =>
      throw _privateConstructorUsedError;
}
