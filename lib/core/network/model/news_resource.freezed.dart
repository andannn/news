// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsResourceDto _$NewsResourceDtoFromJson(Map<String, dynamic> json) {
  return _NewsResourceDto.fromJson(json);
}

/// @nodoc
mixin _$NewsResourceDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get headerImageUrl => throw _privateConstructorUsedError;
  NewsResourceType get type => throw _privateConstructorUsedError;
  DateTime? get publishDate => throw _privateConstructorUsedError;
  List<String> get topics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsResourceDtoCopyWith<NewsResourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsResourceDtoCopyWith<$Res> {
  factory $NewsResourceDtoCopyWith(
          NewsResourceDto value, $Res Function(NewsResourceDto) then) =
      _$NewsResourceDtoCopyWithImpl<$Res, NewsResourceDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String url,
      String headerImageUrl,
      NewsResourceType type,
      DateTime? publishDate,
      List<String> topics});
}

/// @nodoc
class _$NewsResourceDtoCopyWithImpl<$Res, $Val extends NewsResourceDto>
    implements $NewsResourceDtoCopyWith<$Res> {
  _$NewsResourceDtoCopyWithImpl(this._value, this._then);

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
    Object? headerImageUrl = null,
    Object? type = null,
    Object? publishDate = freezed,
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
      headerImageUrl: null == headerImageUrl
          ? _value.headerImageUrl
          : headerImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NewsResourceType,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsResourceDtoCopyWith<$Res>
    implements $NewsResourceDtoCopyWith<$Res> {
  factory _$$_NewsResourceDtoCopyWith(
          _$_NewsResourceDto value, $Res Function(_$_NewsResourceDto) then) =
      __$$_NewsResourceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      String url,
      String headerImageUrl,
      NewsResourceType type,
      DateTime? publishDate,
      List<String> topics});
}

/// @nodoc
class __$$_NewsResourceDtoCopyWithImpl<$Res>
    extends _$NewsResourceDtoCopyWithImpl<$Res, _$_NewsResourceDto>
    implements _$$_NewsResourceDtoCopyWith<$Res> {
  __$$_NewsResourceDtoCopyWithImpl(
      _$_NewsResourceDto _value, $Res Function(_$_NewsResourceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? url = null,
    Object? headerImageUrl = null,
    Object? type = null,
    Object? publishDate = freezed,
    Object? topics = null,
  }) {
    return _then(_$_NewsResourceDto(
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
      headerImageUrl: null == headerImageUrl
          ? _value.headerImageUrl
          : headerImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NewsResourceType,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsResourceDto implements _NewsResourceDto {
  _$_NewsResourceDto(
      {this.id = "",
      this.title = "",
      this.content = "",
      this.url = "",
      this.headerImageUrl = "",
      this.type = NewsResourceType.unknown,
      this.publishDate,
      final List<String> topics = const []})
      : _topics = topics;

  factory _$_NewsResourceDto.fromJson(Map<String, dynamic> json) =>
      _$$_NewsResourceDtoFromJson(json);

  @override
  @JsonKey()
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
  @JsonKey()
  final String headerImageUrl;
  @override
  @JsonKey()
  final NewsResourceType type;
  @override
  final DateTime? publishDate;
  final List<String> _topics;
  @override
  @JsonKey()
  List<String> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'NewsResourceDto(id: $id, title: $title, content: $content, url: $url, headerImageUrl: $headerImageUrl, type: $type, publishDate: $publishDate, topics: $topics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsResourceDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.headerImageUrl, headerImageUrl) ||
                other.headerImageUrl == headerImageUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      url,
      headerImageUrl,
      type,
      publishDate,
      const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsResourceDtoCopyWith<_$_NewsResourceDto> get copyWith =>
      __$$_NewsResourceDtoCopyWithImpl<_$_NewsResourceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsResourceDtoToJson(
      this,
    );
  }
}

abstract class _NewsResourceDto implements NewsResourceDto {
  factory _NewsResourceDto(
      {final String id,
      final String title,
      final String content,
      final String url,
      final String headerImageUrl,
      final NewsResourceType type,
      final DateTime? publishDate,
      final List<String> topics}) = _$_NewsResourceDto;

  factory _NewsResourceDto.fromJson(Map<String, dynamic> json) =
      _$_NewsResourceDto.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get url;
  @override
  String get headerImageUrl;
  @override
  NewsResourceType get type;
  @override
  DateTime? get publishDate;
  @override
  List<String> get topics;
  @override
  @JsonKey(ignore: true)
  _$$_NewsResourceDtoCopyWith<_$_NewsResourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
