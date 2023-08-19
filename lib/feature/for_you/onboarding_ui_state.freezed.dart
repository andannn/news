// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Shown {
  List<FollowableTopic> get topics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShownCopyWith<Shown> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShownCopyWith<$Res> {
  factory $ShownCopyWith(Shown value, $Res Function(Shown) then) =
      _$ShownCopyWithImpl<$Res, Shown>;
  @useResult
  $Res call({List<FollowableTopic> topics});
}

/// @nodoc
class _$ShownCopyWithImpl<$Res, $Val extends Shown>
    implements $ShownCopyWith<$Res> {
  _$ShownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
  }) {
    return _then(_value.copyWith(
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<FollowableTopic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShownCopyWith<$Res> implements $ShownCopyWith<$Res> {
  factory _$$_ShownCopyWith(_$_Shown value, $Res Function(_$_Shown) then) =
      __$$_ShownCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FollowableTopic> topics});
}

/// @nodoc
class __$$_ShownCopyWithImpl<$Res> extends _$ShownCopyWithImpl<$Res, _$_Shown>
    implements _$$_ShownCopyWith<$Res> {
  __$$_ShownCopyWithImpl(_$_Shown _value, $Res Function(_$_Shown) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
  }) {
    return _then(_$_Shown(
      null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<FollowableTopic>,
    ));
  }
}

/// @nodoc

class _$_Shown implements _Shown {
  _$_Shown(final List<FollowableTopic> topics) : _topics = topics;

  final List<FollowableTopic> _topics;
  @override
  List<FollowableTopic> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'Shown(topics: $topics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Shown &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShownCopyWith<_$_Shown> get copyWith =>
      __$$_ShownCopyWithImpl<_$_Shown>(this, _$identity);
}

abstract class _Shown implements Shown {
  factory _Shown(final List<FollowableTopic> topics) = _$_Shown;

  @override
  List<FollowableTopic> get topics;
  @override
  @JsonKey(ignore: true)
  _$$_ShownCopyWith<_$_Shown> get copyWith =>
      throw _privateConstructorUsedError;
}
