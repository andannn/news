import 'package:equatable/equatable.dart';
import 'package:news/core/data/model/news_recsource.dart';

sealed class BookMarkedNewsState extends Equatable {
  const BookMarkedNewsState();
}

class BookMarkedLoading extends BookMarkedNewsState {
  const BookMarkedLoading();

  @override
  List<Object?> get props => [];
}

class BookMarkedReady extends BookMarkedNewsState {
  const BookMarkedReady(this.bookMarkedResource);

  final List<NewsResource> bookMarkedResource;

  @override
  List<Object?> get props => [bookMarkedResource];
}
