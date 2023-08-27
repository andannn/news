import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/usecase/get_followable_topic_by_id_use_case.dart';
import 'package:news/feature/topic/bloc/topic_ui_state.dart';

part 'topic_event.dart';

class TopicBloc extends Bloc<TopicEvent, TopicUiState> {
  TopicBloc({
    required String topicId,
    required GetFollowableTopicByIdUseCase getFollowableTopicByIdUseCase,
    required NewsRepository newsRepository,
    required UserDataRepository userDataRepository,
  })  : _userDataRepository = userDataRepository,
        _topicId = topicId,
        super(TopicUiState()) {
    on<_OnFollowedStateChanged>(_onFollowedStateChanged);
    on<_OnBookmarkedNewsIdsChanged>(_onBookmarkedNewsIdsChanged);
    on<_OnNewsResourcesChanged>(_onNewsResourcesChanged);
    on<_FollowedTopicsChanged>(_followedTopicsChanged);
    on<OnNewsBookMarkedStateChanged>(_onNewsBookMarkedStateChanged);
    on<OnTopicFollowedStateChanged>(_onTopicFollowedStateChanged);

    _onboardingUiStateSub = getFollowableTopicByIdUseCase
        .invoke(topicId)
        .distinct()
        .listen((followableTopic) {
      add(_OnFollowedStateChanged(followableTopic));
    });

    _onSavedNewsIdsChangedSub = userDataRepository
        .getSavedNewsResourcesStream()
        .distinct()
        .listen((savedNewsIds) {
      add(_OnBookmarkedNewsIdsChanged(savedNewsIds));
    });

    _followedTopicsChangedSub = userDataRepository
        .getFollowedTopicIdsStream()
        .distinct()
        .listen((followedIds) {
      add(_FollowedTopicsChanged(followedIds));
    });

    _onNewsResourceChangedSub = newsRepository
        .getNewsResources(filterTopicIds: {topicId})
        .distinct()
        .listen((newsResources) {
          add(_OnNewsResourcesChanged(newsResources));
        });
  }

  final UserDataRepository _userDataRepository;
  final String _topicId;
  StreamSubscription<FollowableTopic>? _onboardingUiStateSub;
  StreamSubscription<List<String>>? _onSavedNewsIdsChangedSub;
  StreamSubscription<List<NewsResource>>? _onNewsResourceChangedSub;
  StreamSubscription<List<String>>? _followedTopicsChangedSub;

  @override
  Future<void> close() async {
    super.close();
    _onboardingUiStateSub?.cancel();
    _onSavedNewsIdsChangedSub?.cancel();
    _onNewsResourceChangedSub?.cancel();
    _followedTopicsChangedSub?.cancel();
  }

  Future<void> _onFollowedStateChanged(
      _OnFollowedStateChanged event, Emitter<TopicUiState> emit) async {
    emit(state.copyWith(followedTopic: event.topic));
  }

  Future<void> _onBookmarkedNewsIdsChanged(
      _OnBookmarkedNewsIdsChanged event, Emitter<TopicUiState> emit) async {
    emit(state.copyWith(bookmarkedNewsId: event.followedNewsIds));
  }

  Future<void> _onNewsResourcesChanged(
      _OnNewsResourcesChanged event, Emitter<TopicUiState> emit) async {
    emit(state.copyWith(newsResourcesInTopic: event.newsResources));
  }

  Future<void> _followedTopicsChanged(
      _FollowedTopicsChanged event, Emitter<TopicUiState> emit) async {
    emit(state.copyWith(followedTopicIds: event.followedTopicIds));
  }

  Future<void> _onNewsBookMarkedStateChanged(
      OnNewsBookMarkedStateChanged event, Emitter<TopicUiState> emit) async {
    _userDataRepository.updateNewsResourceBookmark(
        event.newsResId, event.isSaved);
  }

  Future<void> _onTopicFollowedStateChanged(
      OnTopicFollowedStateChanged event, Emitter<TopicUiState> emit) async {
    _userDataRepository.toggleFollowedTopicId(
        topicId: _topicId, followed: event.isFollowed);
  }
}
