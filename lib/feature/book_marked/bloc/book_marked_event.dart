part of 'book_marked_bloc.dart';

sealed class BookMarkedEvent {}

class _OnBookMarkedNewsStateChanged extends BookMarkedEvent {
  _OnBookMarkedNewsStateChanged(this.bookMarkedNews);

  final List<NewsResource> bookMarkedNews;
}

class OnBookMarkedNewsRemoved extends BookMarkedEvent {
  OnBookMarkedNewsRemoved(this.removedId);

  final String removedId;
}

class OnUndoRemoveBookMarkedNews extends BookMarkedEvent {
  OnUndoRemoveBookMarkedNews();
}

class _OnFollowedTopicChanged extends BookMarkedEvent {
  final List<String> topics;

  _OnFollowedTopicChanged(this.topics);
}