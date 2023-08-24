import 'package:equatable/equatable.dart';
import 'package:news/core/data/model/news_recsource.dart';

sealed class BookMarkedUiState extends Equatable {}

class BookMarkedLoadingState extends BookMarkedUiState {
  @override
  List<Object?> get props => [];
}

class BookMarkedReadyState extends BookMarkedUiState {
  BookMarkedReadyState(this.bookMarkedResource);

  final List<NewsResource> bookMarkedResource;

  @override
  List<Object?> get props => [bookMarkedResource];
}
