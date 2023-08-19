// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'for_you_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForYouUiState {
  @JsonKey(name: 'onboarding_ui_state')
  OnboardingUiState get onboardingUiState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForYouUiStateCopyWith<ForYouUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForYouUiStateCopyWith<$Res> {
  factory $ForYouUiStateCopyWith(
          ForYouUiState value, $Res Function(ForYouUiState) then) =
      _$ForYouUiStateCopyWithImpl<$Res, ForYouUiState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'onboarding_ui_state')
      OnboardingUiState onboardingUiState});
}

/// @nodoc
class _$ForYouUiStateCopyWithImpl<$Res, $Val extends ForYouUiState>
    implements $ForYouUiStateCopyWith<$Res> {
  _$ForYouUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboardingUiState = null,
  }) {
    return _then(_value.copyWith(
      onboardingUiState: null == onboardingUiState
          ? _value.onboardingUiState
          : onboardingUiState // ignore: cast_nullable_to_non_nullable
              as OnboardingUiState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForYouUiStateCopyWith<$Res>
    implements $ForYouUiStateCopyWith<$Res> {
  factory _$$_ForYouUiStateCopyWith(
          _$_ForYouUiState value, $Res Function(_$_ForYouUiState) then) =
      __$$_ForYouUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'onboarding_ui_state')
      OnboardingUiState onboardingUiState});
}

/// @nodoc
class __$$_ForYouUiStateCopyWithImpl<$Res>
    extends _$ForYouUiStateCopyWithImpl<$Res, _$_ForYouUiState>
    implements _$$_ForYouUiStateCopyWith<$Res> {
  __$$_ForYouUiStateCopyWithImpl(
      _$_ForYouUiState _value, $Res Function(_$_ForYouUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboardingUiState = null,
  }) {
    return _then(_$_ForYouUiState(
      null == onboardingUiState
          ? _value.onboardingUiState
          : onboardingUiState // ignore: cast_nullable_to_non_nullable
              as OnboardingUiState,
    ));
  }
}

/// @nodoc

class _$_ForYouUiState implements _ForYouUiState {
  _$_ForYouUiState(
      @JsonKey(name: 'onboarding_ui_state') this.onboardingUiState);

  @override
  @JsonKey(name: 'onboarding_ui_state')
  final OnboardingUiState onboardingUiState;

  @override
  String toString() {
    return 'ForYouUiState(onboardingUiState: $onboardingUiState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForYouUiState &&
            (identical(other.onboardingUiState, onboardingUiState) ||
                other.onboardingUiState == onboardingUiState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onboardingUiState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForYouUiStateCopyWith<_$_ForYouUiState> get copyWith =>
      __$$_ForYouUiStateCopyWithImpl<_$_ForYouUiState>(this, _$identity);
}

abstract class _ForYouUiState implements ForYouUiState {
  factory _ForYouUiState(
      @JsonKey(name: 'onboarding_ui_state')
      final OnboardingUiState onboardingUiState) = _$_ForYouUiState;

  @override
  @JsonKey(name: 'onboarding_ui_state')
  OnboardingUiState get onboardingUiState;
  @override
  @JsonKey(ignore: true)
  _$$_ForYouUiStateCopyWith<_$_ForYouUiState> get copyWith =>
      throw _privateConstructorUsedError;
}
