import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/feature/book_marked/bloc/book_marked_ui_state.dart';

import 'book_marked_news_state.dart';

part 'book_marked_event.dart';

class BookMarkedBloc extends Bloc<BookMarkedEvent, BookMarkedUiState> {
  BookMarkedBloc(
      {required UserDataRepository userDataRepository,
      required NewsRepository newsRepository})
      : _userDataRepository = userDataRepository,
        _newsRepository = newsRepository,
        super(BookMarkedUiState()) {
    on<_OnBookMarkedNewsStateChanged>(_onBookMarkedNewsStateChanged);
    on<_OnFollowedTopicChanged>(_onFollowedTopicChanged);
    on<OnBookMarkedNewsRemoved>(onBookMarkedNewsRemoved);
    on<OnUndoRemoveBookMarkedNews>(onUndoRemoveBookMarkedNews);

    _bookMarkedNewsIdsSub = _userDataRepository
        .getSavedNewsResourcesStream()
        .listen((newsIds) async {
      if (!const DeepCollectionEquality()
          .equals(_currentBookMarkedIds, newsIds)) {
        _currentBookMarkedIds = newsIds;
        await _cancelLastAndObserveBookMarkedNews();
      }
    });

    _followedTopicIdsSub = userDataRepository
        .getFollowedTopicIdsStream()
        .listen((followedTopicIds) async {
      if (!const DeepCollectionEquality()
          .equals(state.followedTopicIds, followedTopicIds)) {
        add(_OnFollowedTopicChanged(followedTopicIds));
      }
    });
  }

  final UserDataRepository _userDataRepository;
  final NewsRepository _newsRepository;

  List<String> _currentBookMarkedIds = [];

  String? _lastRemovedId;

  StreamSubscription<List<String>>? _bookMarkedNewsIdsSub;
  StreamSubscription<List<NewsResource>>? _bookMarkedNewsResourceSub;
  StreamSubscription<List<String>>? _followedTopicIdsSub;

  @override
  Future<void> close() async {
    super.close();
    _bookMarkedNewsIdsSub?.cancel();
    _bookMarkedNewsResourceSub?.cancel();
    _followedTopicIdsSub?.cancel();
  }

  Future _cancelLastAndObserveBookMarkedNews() async {
    // cancel last subscription.
    await _bookMarkedNewsResourceSub?.cancel();

    if (_currentBookMarkedIds.isEmpty) {
      // no need to observe stream when no bookmarked news.
      add(_OnBookMarkedNewsStateChanged([]));
      return;
    }

    // get new stream add start observe.
    final stream = _newsRepository
        .getNewsResources(filterNewsIds: _currentBookMarkedIds.toSet())
        .distinct();
    _bookMarkedNewsResourceSub = stream.listen((bookMarkedNews) {
      add(_OnBookMarkedNewsStateChanged(bookMarkedNews));
    });
  }

  Future<void> _onBookMarkedNewsStateChanged(
      _OnBookMarkedNewsStateChanged event,
      Emitter<BookMarkedUiState> emit) async {
    emit(state.copyWith(
        bookMarkedNewsState: BookMarkedReady(event.bookMarkedNews)));
  }

  Future<void> onBookMarkedNewsRemoved(
      OnBookMarkedNewsRemoved event, Emitter<BookMarkedUiState> emit) async {
    _lastRemovedId = event.removedId;
    await userDataRepository.updateNewsResourceBookmark(event.removedId, false);
  }

  Future<void> onUndoRemoveBookMarkedNews(
      OnUndoRemoveBookMarkedNews event, Emitter<BookMarkedUiState> emit) async {
    final lastRemovedId = _lastRemovedId;
    if (lastRemovedId != null) {
      await userDataRepository.updateNewsResourceBookmark(lastRemovedId, true);
      _lastRemovedId = null;
    }
  }

  Future<void> _onFollowedTopicChanged(
      _OnFollowedTopicChanged event, Emitter<BookMarkedUiState> emit) async {
    emit(state.copyWith(
        followedTopicIds: event.topics));
  }
}
