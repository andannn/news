// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingUiState {
  String? get test => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingUiStateCopyWith<SettingUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingUiStateCopyWith<$Res> {
  factory $SettingUiStateCopyWith(
          SettingUiState value, $Res Function(SettingUiState) then) =
      _$SettingUiStateCopyWithImpl<$Res, SettingUiState>;
  @useResult
  $Res call({String? test});
}

/// @nodoc
class _$SettingUiStateCopyWithImpl<$Res, $Val extends SettingUiState>
    implements $SettingUiStateCopyWith<$Res> {
  _$SettingUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = freezed,
  }) {
    return _then(_value.copyWith(
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingUiStateCopyWith<$Res>
    implements $SettingUiStateCopyWith<$Res> {
  factory _$$_SettingUiStateCopyWith(
          _$_SettingUiState value, $Res Function(_$_SettingUiState) then) =
      __$$_SettingUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? test});
}

/// @nodoc
class __$$_SettingUiStateCopyWithImpl<$Res>
    extends _$SettingUiStateCopyWithImpl<$Res, _$_SettingUiState>
    implements _$$_SettingUiStateCopyWith<$Res> {
  __$$_SettingUiStateCopyWithImpl(
      _$_SettingUiState _value, $Res Function(_$_SettingUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = freezed,
  }) {
    return _then(_$_SettingUiState(
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SettingUiState implements _SettingUiState {
  _$_SettingUiState({this.test});

  @override
  final String? test;

  @override
  String toString() {
    return 'SettingUiState(test: $test)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingUiState &&
            (identical(other.test, test) || other.test == test));
  }

  @override
  int get hashCode => Object.hash(runtimeType, test);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingUiStateCopyWith<_$_SettingUiState> get copyWith =>
      __$$_SettingUiStateCopyWithImpl<_$_SettingUiState>(this, _$identity);
}

abstract class _SettingUiState implements SettingUiState {
  factory _SettingUiState({final String? test}) = _$_SettingUiState;

  @override
  String? get test;
  @override
  @JsonKey(ignore: true)
  _$$_SettingUiStateCopyWith<_$_SettingUiState> get copyWith =>
      throw _privateConstructorUsedError;
}
