import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/feature/book_marked/bloc/book_marked_news_state.dart';

part 'book_marked_ui_state.freezed.dart';

@freezed
class BookMarkedUiState with _$BookMarkedUiState {
  factory BookMarkedUiState(
      {@Default(BookMarkedLoading()) BookMarkedNewsState bookMarkedNewsState,
        @Default([]) List<String> followedTopicIds}) = _BookMarkedUiState;
}
