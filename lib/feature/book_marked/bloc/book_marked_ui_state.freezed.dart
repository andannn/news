// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_marked_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookMarkedUiState {
  BookMarkedNewsState get bookMarkedNewsState =>
      throw _privateConstructorUsedError;
  List<String> get followedTopicIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookMarkedUiStateCopyWith<BookMarkedUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookMarkedUiStateCopyWith<$Res> {
  factory $BookMarkedUiStateCopyWith(
          BookMarkedUiState value, $Res Function(BookMarkedUiState) then) =
      _$BookMarkedUiStateCopyWithImpl<$Res, BookMarkedUiState>;
  @useResult
  $Res call(
      {BookMarkedNewsState bookMarkedNewsState, List<String> followedTopicIds});
}

/// @nodoc
class _$BookMarkedUiStateCopyWithImpl<$Res, $Val extends BookMarkedUiState>
    implements $BookMarkedUiStateCopyWith<$Res> {
  _$BookMarkedUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookMarkedNewsState = null,
    Object? followedTopicIds = null,
  }) {
    return _then(_value.copyWith(
      bookMarkedNewsState: null == bookMarkedNewsState
          ? _value.bookMarkedNewsState
          : bookMarkedNewsState // ignore: cast_nullable_to_non_nullable
              as BookMarkedNewsState,
      followedTopicIds: null == followedTopicIds
          ? _value.followedTopicIds
          : followedTopicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookMarkedUiStateCopyWith<$Res>
    implements $BookMarkedUiStateCopyWith<$Res> {
  factory _$$_BookMarkedUiStateCopyWith(_$_BookMarkedUiState value,
          $Res Function(_$_BookMarkedUiState) then) =
      __$$_BookMarkedUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BookMarkedNewsState bookMarkedNewsState, List<String> followedTopicIds});
}

/// @nodoc
class __$$_BookMarkedUiStateCopyWithImpl<$Res>
    extends _$BookMarkedUiStateCopyWithImpl<$Res, _$_BookMarkedUiState>
    implements _$$_BookMarkedUiStateCopyWith<$Res> {
  __$$_BookMarkedUiStateCopyWithImpl(
      _$_BookMarkedUiState _value, $Res Function(_$_BookMarkedUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookMarkedNewsState = null,
    Object? followedTopicIds = null,
  }) {
    return _then(_$_BookMarkedUiState(
      bookMarkedNewsState: null == bookMarkedNewsState
          ? _value.bookMarkedNewsState
          : bookMarkedNewsState // ignore: cast_nullable_to_non_nullable
              as BookMarkedNewsState,
      followedTopicIds: null == followedTopicIds
          ? _value._followedTopicIds
          : followedTopicIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_BookMarkedUiState implements _BookMarkedUiState {
  _$_BookMarkedUiState(
      {this.bookMarkedNewsState = const BookMarkedLoading(),
      final List<String> followedTopicIds = const []})
      : _followedTopicIds = followedTopicIds;

  @override
  @JsonKey()
  final BookMarkedNewsState bookMarkedNewsState;
  final List<String> _followedTopicIds;
  @override
  @JsonKey()
  List<String> get followedTopicIds {
    if (_followedTopicIds is EqualUnmodifiableListView)
      return _followedTopicIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followedTopicIds);
  }

  @override
  String toString() {
    return 'BookMarkedUiState(bookMarkedNewsState: $bookMarkedNewsState, followedTopicIds: $followedTopicIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookMarkedUiState &&
            (identical(other.bookMarkedNewsState, bookMarkedNewsState) ||
                other.bookMarkedNewsState == bookMarkedNewsState) &&
            const DeepCollectionEquality()
                .equals(other._followedTopicIds, _followedTopicIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookMarkedNewsState,
      const DeepCollectionEquality().hash(_followedTopicIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookMarkedUiStateCopyWith<_$_BookMarkedUiState> get copyWith =>
      __$$_BookMarkedUiStateCopyWithImpl<_$_BookMarkedUiState>(
          this, _$identity);
}

abstract class _BookMarkedUiState implements BookMarkedUiState {
  factory _BookMarkedUiState(
      {final BookMarkedNewsState bookMarkedNewsState,
      final List<String> followedTopicIds}) = _$_BookMarkedUiState;

  @override
  BookMarkedNewsState get bookMarkedNewsState;
  @override
  List<String> get followedTopicIds;
  @override
  @JsonKey(ignore: true)
  _$$_BookMarkedUiStateCopyWith<_$_BookMarkedUiState> get copyWith =>
      throw _privateConstructorUsedError;
}
