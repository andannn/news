// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_resource_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsResourceEntity _$NewsResourceEntityFromJson(Map<String, dynamic> json) {
  return _NewsResourceEntity.fromJson(json);
}

/// @nodoc
mixin _$NewsResourceEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'header_image_url')
  String get headerImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'publish_date')
  DateTime? get publishDate => throw _privateConstructorUsedError;
  NewsResourceType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsResourceEntityCopyWith<NewsResourceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsResourceEntityCopyWith<$Res> {
  factory $NewsResourceEntityCopyWith(
          NewsResourceEntity value, $Res Function(NewsResourceEntity) then) =
      _$NewsResourceEntityCopyWithImpl<$Res, NewsResourceEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      String url,
      @JsonKey(name: 'header_image_url') String headerImageUrl,
      @JsonKey(name: 'publish_date') DateTime? publishDate,
      NewsResourceType type});
}

/// @nodoc
class _$NewsResourceEntityCopyWithImpl<$Res, $Val extends NewsResourceEntity>
    implements $NewsResourceEntityCopyWith<$Res> {
  _$NewsResourceEntityCopyWithImpl(this._value, this._then);

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
    Object? publishDate = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NewsResourceType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewsResourceEntityCopyWith<$Res>
    implements $NewsResourceEntityCopyWith<$Res> {
  factory _$$_NewsResourceEntityCopyWith(_$_NewsResourceEntity value,
          $Res Function(_$_NewsResourceEntity) then) =
      __$$_NewsResourceEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      String url,
      @JsonKey(name: 'header_image_url') String headerImageUrl,
      @JsonKey(name: 'publish_date') DateTime? publishDate,
      NewsResourceType type});
}

/// @nodoc
class __$$_NewsResourceEntityCopyWithImpl<$Res>
    extends _$NewsResourceEntityCopyWithImpl<$Res, _$_NewsResourceEntity>
    implements _$$_NewsResourceEntityCopyWith<$Res> {
  __$$_NewsResourceEntityCopyWithImpl(
      _$_NewsResourceEntity _value, $Res Function(_$_NewsResourceEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? url = null,
    Object? headerImageUrl = null,
    Object? publishDate = freezed,
    Object? type = null,
  }) {
    return _then(_$_NewsResourceEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NewsResourceType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsResourceEntity implements _NewsResourceEntity {
  _$_NewsResourceEntity(
      {this.id = -1,
      this.title = "",
      this.content = "",
      this.url = "",
      @JsonKey(name: 'header_image_url') this.headerImageUrl = "",
      @JsonKey(name: 'publish_date') this.publishDate = null,
      this.type = NewsResourceType.unknown});

  factory _$_NewsResourceEntity.fromJson(Map<String, dynamic> json) =>
      _$$_NewsResourceEntityFromJson(json);

  @override
  @JsonKey()
  final int id;
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
  @JsonKey(name: 'header_image_url')
  final String headerImageUrl;
  @override
  @JsonKey(name: 'publish_date')
  final DateTime? publishDate;
  @override
  @JsonKey()
  final NewsResourceType type;

  @override
  String toString() {
    return 'NewsResourceEntity(id: $id, title: $title, content: $content, url: $url, headerImageUrl: $headerImageUrl, publishDate: $publishDate, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsResourceEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.headerImageUrl, headerImageUrl) ||
                other.headerImageUrl == headerImageUrl) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, url, headerImageUrl, publishDate, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsResourceEntityCopyWith<_$_NewsResourceEntity> get copyWith =>
      __$$_NewsResourceEntityCopyWithImpl<_$_NewsResourceEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsResourceEntityToJson(
      this,
    );
  }
}

abstract class _NewsResourceEntity implements NewsResourceEntity {
  factory _NewsResourceEntity(
      {final int id,
      final String title,
      final String content,
      final String url,
      @JsonKey(name: 'header_image_url') final String headerImageUrl,
      @JsonKey(name: 'publish_date') final DateTime? publishDate,
      final NewsResourceType type}) = _$_NewsResourceEntity;

  factory _NewsResourceEntity.fromJson(Map<String, dynamic> json) =
      _$_NewsResourceEntity.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  String get url;
  @override
  @JsonKey(name: 'header_image_url')
  String get headerImageUrl;
  @override
  @JsonKey(name: 'publish_date')
  DateTime? get publishDate;
  @override
  NewsResourceType get type;
  @override
  @JsonKey(ignore: true)
  _$$_NewsResourceEntityCopyWith<_$_NewsResourceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
