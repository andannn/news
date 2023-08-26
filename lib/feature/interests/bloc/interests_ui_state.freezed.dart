// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interests_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InterestsUiState {
  List<FollowableTopic> get topics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InterestsUiStateCopyWith<InterestsUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestsUiStateCopyWith<$Res> {
  factory $InterestsUiStateCopyWith(
          InterestsUiState value, $Res Function(InterestsUiState) then) =
      _$InterestsUiStateCopyWithImpl<$Res, InterestsUiState>;
  @useResult
  $Res call({List<FollowableTopic> topics});
}

/// @nodoc
class _$InterestsUiStateCopyWithImpl<$Res, $Val extends InterestsUiState>
    implements $InterestsUiStateCopyWith<$Res> {
  _$InterestsUiStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_InterestsUiStateCopyWith<$Res>
    implements $InterestsUiStateCopyWith<$Res> {
  factory _$$_InterestsUiStateCopyWith(
          _$_InterestsUiState value, $Res Function(_$_InterestsUiState) then) =
      __$$_InterestsUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FollowableTopic> topics});
}

/// @nodoc
class __$$_InterestsUiStateCopyWithImpl<$Res>
    extends _$InterestsUiStateCopyWithImpl<$Res, _$_InterestsUiState>
    implements _$$_InterestsUiStateCopyWith<$Res> {
  __$$_InterestsUiStateCopyWithImpl(
      _$_InterestsUiState _value, $Res Function(_$_InterestsUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topics = null,
  }) {
    return _then(_$_InterestsUiState(
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<FollowableTopic>,
    ));
  }
}

/// @nodoc

class _$_InterestsUiState implements _InterestsUiState {
  _$_InterestsUiState({final List<FollowableTopic> topics = const []})
      : _topics = topics;

  final List<FollowableTopic> _topics;
  @override
  @JsonKey()
  List<FollowableTopic> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'InterestsUiState(topics: $topics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InterestsUiState &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InterestsUiStateCopyWith<_$_InterestsUiState> get copyWith =>
      __$$_InterestsUiStateCopyWithImpl<_$_InterestsUiState>(this, _$identity);
}

abstract class _InterestsUiState implements InterestsUiState {
  factory _InterestsUiState({final List<FollowableTopic> topics}) =
      _$_InterestsUiState;

  @override
  List<FollowableTopic> get topics;
  @override
  @JsonKey(ignore: true)
  _$$_InterestsUiStateCopyWith<_$_InterestsUiState> get copyWith =>
      throw _privateConstructorUsedError;
}
