import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';
import 'package:news/feature/for_you/bloc/news_feed_state.dart';
import 'package:news/feature/for_you/bloc/onboarding_ui_state.dart';
import 'package:rxdart/streams.dart';

part 'for_you_event.dart';

class ForYouBloc extends Bloc<ForYouPageEvent, ForYouUiState> {
  ForYouBloc(
      {required UserDataRepository userDataRepository,
      required NewsRepository newsRepository,
      required GetFollowableTopicsUseCase getFollowableTopicsUseCase})
      : _userDataRepository = userDataRepository,
        _newsRepository = newsRepository,
        super(ForYouUiState()) {
    on<OnUpdateTopicSelection>(_onUpdateTopicSelection);
    on<OnDismissOnboarding>(_onDismissOnboarding);
    on<OnNewsBookMarkedStateChanged>(_onNewsBookMarkedStateChanged);

    on<_OnBookmarkedNewsChanged>(_onBookmarkedNewsChanged);
    on<_OnBoardingUiStateChanged>(_onBoardingUiStateChanged);
    on<_OnFeedNewsStateChanged>(_onFeedNewsStateChanged);
    on<_OnFollowedTopicChanged>(_onFollowedTopicChanged);

    Stream<bool> shouldHideOnBoardingStream =
        userDataRepository.getShouldHideOnboardingStream();
    Stream<List<FollowableTopic>> followableTopicsStream =
        getFollowableTopicsUseCase.invoke();
    _onboardingUiStateSub = CombineLatestStream.combine2(
            shouldHideOnBoardingStream,
            followableTopicsStream,
            _getOnboardingUiState)
        .distinct()
        .listen((newState) {
      if (newState != state.onboardingUiState) {
        add(_OnBoardingUiStateChanged(newState));
      }
    });

    _followedTopicIdsSub = userDataRepository
        .getFollowedTopicIdsStream()
        .listen((followedTopicIds) async {
      if (!const DeepCollectionEquality()
          .equals(_currentFollowedTopicIds, followedTopicIds)) {
        _currentFollowedTopicIds = followedTopicIds;
        add(_OnFollowedTopicChanged(followedTopicIds));
        await _cancelLastAndObserveFeedNews();
      }
    });

    _bookMarkedNewsResourceSub = userDataRepository
        .getSavedBookmarkedNewsResourcesStream()
        .listen((bookmarkedNewses) async {
      if (!const DeepCollectionEquality()
          .equals(state.bookmarkedNewsIds, bookmarkedNewses)) {
        add(_OnBookmarkedNewsChanged(bookmarkedNewses));
      }
    });
  }

  final UserDataRepository _userDataRepository;
  final NewsRepository _newsRepository;

  List<String> _currentFollowedTopicIds = [];

  StreamSubscription<OnboardingUiState>? _onboardingUiStateSub;
  StreamSubscription<List<String>>? _followedTopicIdsSub;
  StreamSubscription<List<String>>? _bookMarkedNewsResourceSub;

  StreamSubscription<List<NewsResource>>? _feedNewsResourceSub;

  @override
  Future<void> close() async {
    super.close();
    _onboardingUiStateSub?.cancel();
    _followedTopicIdsSub?.cancel();
    _feedNewsResourceSub?.cancel();
    _bookMarkedNewsResourceSub?.cancel();
  }

  Future _cancelLastAndObserveFeedNews() async {
    // cancel last subscription.
    await _feedNewsResourceSub?.cancel();

    if (_currentFollowedTopicIds.isEmpty) {
      // no need to observe stream when no followed topics.
      add(_OnFeedNewsStateChanged(NewsFeedLoadSuccess(const [])));
      return;
    }

    // get new stream add start observe.
    final stream = _newsRepository
        .getNewsResources(filterTopicIds: _currentFollowedTopicIds.toSet())
        .distinct();
    _feedNewsResourceSub = stream.listen((feedNews) {
      final newState = NewsFeedLoadSuccess(feedNews);
      if (newState != state.newsFeedState) {
        add(_OnFeedNewsStateChanged(newState));
      }
    });
  }

  Future<void> _onUpdateTopicSelection(
      OnUpdateTopicSelection event, Emitter<ForYouUiState> emit) async {
    await _userDataRepository.toggleFollowedTopicId(
        topicId: event.topicId, followed: event.isChecked);
  }

  OnboardingUiState _getOnboardingUiState(
      bool shouldHideOnBoarding, List<FollowableTopic> followableTopics) {
    if (shouldHideOnBoarding) {
      return OnboardingNotShown();
    } else {
      return OnboardingShown(followableTopics);
    }
  }

  Future<void> _onBoardingUiStateChanged(
      _OnBoardingUiStateChanged event, Emitter<ForYouUiState> emit) async {
    emit(state.copyWith(onboardingUiState: event.state));
  }

  Future<void> _onDismissOnboarding(
      OnDismissOnboarding event, Emitter<ForYouUiState> emit) async {
    await _userDataRepository.setShouldHideOnboarding(true);
  }

  Future<void> _onFeedNewsStateChanged(
      _OnFeedNewsStateChanged event, Emitter<ForYouUiState> emit) async {
    emit(state.copyWith(newsFeedState: event.state));
  }

  FutureOr<void> _onBookmarkedNewsChanged(
      _OnBookmarkedNewsChanged event, Emitter<ForYouUiState> emit) {
    emit(state.copyWith(bookmarkedNewsIds: event.bookmarkedNewsIds));
  }

  FutureOr<void> _onNewsBookMarkedStateChanged(
      OnNewsBookMarkedStateChanged event, Emitter<ForYouUiState> emit) {
    _userDataRepository.updateNewsResourceBookmark(
        event.newsResId, event.isSaved);
  }

  Future<void> _onFollowedTopicChanged(
      _OnFollowedTopicChanged event, Emitter<ForYouUiState> emit) async {
    emit(state.copyWith(followedTopicIds: event.topics));
  }
}
