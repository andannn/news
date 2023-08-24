part of 'book_marked_bloc.dart';

sealed class BookMarkedEvent {}

class _OnBookMarkedNewsStateChanged extends BookMarkedEvent {
  _OnBookMarkedNewsStateChanged(this.bookMarkedNews);

  final List<NewsResource> bookMarkedNews;
}
