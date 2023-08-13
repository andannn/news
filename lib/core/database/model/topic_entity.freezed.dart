// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopicEntity _$TopicEntityFromJson(Map<String, dynamic> json) {
  return _TopicEntity.fromJson(json);
}

/// @nodoc
mixin _$TopicEntity {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;
  String get longDescription => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicEntityCopyWith<TopicEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicEntityCopyWith<$Res> {
  factory $TopicEntityCopyWith(
          TopicEntity value, $Res Function(TopicEntity) then) =
      _$TopicEntityCopyWithImpl<$Res, TopicEntity>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String shortDescription,
      String longDescription,
      String url,
      String imageUrl});
}

/// @nodoc
class _$TopicEntityCopyWithImpl<$Res, $Val extends TopicEntity>
    implements $TopicEntityCopyWith<$Res> {
  _$TopicEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? shortDescription = null,
    Object? longDescription = null,
    Object? url = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopicEntityCopyWith<$Res>
    implements $TopicEntityCopyWith<$Res> {
  factory _$$_TopicEntityCopyWith(
          _$_TopicEntity value, $Res Function(_$_TopicEntity) then) =
      __$$_TopicEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String shortDescription,
      String longDescription,
      String url,
      String imageUrl});
}

/// @nodoc
class __$$_TopicEntityCopyWithImpl<$Res>
    extends _$TopicEntityCopyWithImpl<$Res, _$_TopicEntity>
    implements _$$_TopicEntityCopyWith<$Res> {
  __$$_TopicEntityCopyWithImpl(
      _$_TopicEntity _value, $Res Function(_$_TopicEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? shortDescription = null,
    Object? longDescription = null,
    Object? url = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_TopicEntity(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopicEntity implements _TopicEntity {
  _$_TopicEntity(
      {this.id,
      this.name = "",
      this.shortDescription = "",
      this.longDescription = "",
      this.url = "",
      this.imageUrl = ""});

  factory _$_TopicEntity.fromJson(Map<String, dynamic> json) =>
      _$$_TopicEntityFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String shortDescription;
  @override
  @JsonKey()
  final String longDescription;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String imageUrl;

  @override
  String toString() {
    return 'TopicEntity(id: $id, name: $name, shortDescription: $shortDescription, longDescription: $longDescription, url: $url, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopicEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, shortDescription, longDescription, url, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopicEntityCopyWith<_$_TopicEntity> get copyWith =>
      __$$_TopicEntityCopyWithImpl<_$_TopicEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopicEntityToJson(
      this,
    );
  }
}

abstract class _TopicEntity implements TopicEntity {
  factory _TopicEntity(
      {final int? id,
      final String name,
      final String shortDescription,
      final String longDescription,
      final String url,
      final String imageUrl}) = _$_TopicEntity;

  factory _TopicEntity.fromJson(Map<String, dynamic> json) =
      _$_TopicEntity.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String get shortDescription;
  @override
  String get longDescription;
  @override
  String get url;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_TopicEntityCopyWith<_$_TopicEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
