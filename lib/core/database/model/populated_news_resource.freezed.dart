// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'populated_news_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PopulatedNewsResource {
  NewsResourceEntity get entity => throw _privateConstructorUsedError;
  List<TopicEntity> get topics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PopulatedNewsResourceCopyWith<PopulatedNewsResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PopulatedNewsResourceCopyWith<$Res> {
  factory $PopulatedNewsResourceCopyWith(PopulatedNewsResource value,
          $Res Function(PopulatedNewsResource) then) =
      _$PopulatedNewsResourceCopyWithImpl<$Res, PopulatedNewsResource>;
  @useResult
  $Res call({NewsResourceEntity entity, List<TopicEntity> topics});

  $NewsResourceEntityCopyWith<$Res> get entity;
}

/// @nodoc
class _$PopulatedNewsResourceCopyWithImpl<$Res,
        $Val extends PopulatedNewsResource>
    implements $PopulatedNewsResourceCopyWith<$Res> {
  _$PopulatedNewsResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? topics = null,
  }) {
    return _then(_value.copyWith(
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as NewsResourceEntity,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<TopicEntity>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NewsResourceEntityCopyWith<$Res> get entity {
    return $NewsResourceEntityCopyWith<$Res>(_value.entity, (value) {
      return _then(_value.copyWith(entity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PopulatedNewsResourceCopyWith<$Res>
    implements $PopulatedNewsResourceCopyWith<$Res> {
  factory _$$_PopulatedNewsResourceCopyWith(_$_PopulatedNewsResource value,
          $Res Function(_$_PopulatedNewsResource) then) =
      __$$_PopulatedNewsResourceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NewsResourceEntity entity, List<TopicEntity> topics});

  @override
  $NewsResourceEntityCopyWith<$Res> get entity;
}

/// @nodoc
class __$$_PopulatedNewsResourceCopyWithImpl<$Res>
    extends _$PopulatedNewsResourceCopyWithImpl<$Res, _$_PopulatedNewsResource>
    implements _$$_PopulatedNewsResourceCopyWith<$Res> {
  __$$_PopulatedNewsResourceCopyWithImpl(_$_PopulatedNewsResource _value,
      $Res Function(_$_PopulatedNewsResource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? topics = null,
  }) {
    return _then(_$_PopulatedNewsResource(
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as NewsResourceEntity,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<TopicEntity>,
    ));
  }
}

/// @nodoc

class _$_PopulatedNewsResource implements _PopulatedNewsResource {
  _$_PopulatedNewsResource(
      {required this.entity, required final List<TopicEntity> topics})
      : _topics = topics;

  @override
  final NewsResourceEntity entity;
  final List<TopicEntity> _topics;
  @override
  List<TopicEntity> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'PopulatedNewsResource(entity: $entity, topics: $topics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PopulatedNewsResource &&
            (identical(other.entity, entity) || other.entity == entity) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, entity, const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PopulatedNewsResourceCopyWith<_$_PopulatedNewsResource> get copyWith =>
      __$$_PopulatedNewsResourceCopyWithImpl<_$_PopulatedNewsResource>(
          this, _$identity);
}

abstract class _PopulatedNewsResource implements PopulatedNewsResource {
  factory _PopulatedNewsResource(
      {required final NewsResourceEntity entity,
      required final List<TopicEntity> topics}) = _$_PopulatedNewsResource;

  @override
  NewsResourceEntity get entity;
  @override
  List<TopicEntity> get topics;
  @override
  @JsonKey(ignore: true)
  _$$_PopulatedNewsResourceCopyWith<_$_PopulatedNewsResource> get copyWith =>
      throw _privateConstructorUsedError;
}
