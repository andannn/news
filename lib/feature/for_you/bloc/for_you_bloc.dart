import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news/common/log_util.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:news/feature/for_you/bloc/for_you_event.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';
import 'package:news/feature/for_you/bloc/news_feed_state.dart';
import 'package:news/feature/for_you/bloc/onboarding_ui_state.dart';
import 'package:rxdart/streams.dart';

class ForYouBloc extends Bloc<ForYouPageEvent, ForYouUiState> {
  ForYouBloc(
      {required UserDataRepository userDataRepository,
      required NewsRepository newsRepository,
      required GetFollowableTopicsUseCase getFollowableTopicsUseCase})
      : _userDataRepository = userDataRepository,
        _newsRepository = newsRepository,
        super(ForYouUiState(OnboardingLoading(), NewsFeedLoading())) {
    on<OnUpdateTopicSelection>(_onUpdateTopicSelection);
    on<OnBoardingUiStateChanged>(_onBoardingUiStateChanged);
    on<OnFeedNewsStateChanged>(_onFeedNewsStateChanged);
    on<OnDismissOnboarding>(_onDismissOnboarding);

    Stream<bool> shouldHideOnBoardingStream =
        userDataRepository.getShouldHideOnboardingStream();
    Stream<List<String>> followedTopicIdsStream =
        userDataRepository.getFollowedTopicIdsStream();
    Stream<List<FollowableTopic>> followableTopicsStream =
        getFollowableTopicsUseCase.invoke();

    Stream<OnboardingUiState> onboardingUiStateStream =
        CombineLatestStream.combine2(shouldHideOnBoardingStream,
                followableTopicsStream, _getOnboardingUiState)
            .distinct();

    _onboardingUiStateSub = onboardingUiStateStream.listen((event) {
      add(OnBoardingUiStateChanged(event));
    });

    _followedTopicIdsSub = followedTopicIdsStream.listen((followedTopicIds) async {
      if (_currentFollowedTopicIds != followedTopicIds) {
        _currentFollowedTopicIds = followedTopicIds;
        await _cancelLastAndObserveFeedNews();
      }
    });
  }

  final UserDataRepository _userDataRepository;
  final NewsRepository _newsRepository;

  List<String> _currentFollowedTopicIds = [];

  StreamSubscription<OnboardingUiState>? _onboardingUiStateSub;
  StreamSubscription<List<String>>? _followedTopicIdsSub;

  StreamSubscription<List<NewsResource>>? _feedNewsResourceSub;

  @override
  Future<void> close() async {
    super.close();
    _onboardingUiStateSub?.cancel();
    _followedTopicIdsSub?.cancel();
    _feedNewsResourceSub?.cancel();
  }

  @override
  void onChange(Change<ForYouUiState> change) {
    super.onChange(change);

    logUtil('ForYouBloc data change to :$change');
  }

  Future _cancelLastAndObserveFeedNews() async {
    // cancel last subscription.
    await _feedNewsResourceSub?.cancel();

    if (_currentFollowedTopicIds.isEmpty) {
      // no need to observe stream when no followed topics.
      add(OnFeedNewsStateChanged(NewsFeedLoadSuccess(const [])));
      return;
    }

    // get new stream add start observe.
    final stream = _newsRepository.getNewsResources(
        filterTopicIds: _currentFollowedTopicIds.toSet()).distinct();
    _feedNewsResourceSub = stream.listen((feedNews) {
      print('ondata feedNews $feedNews');
      add(OnFeedNewsStateChanged(NewsFeedLoadSuccess(feedNews)));
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
      OnBoardingUiStateChanged event, Emitter<ForYouUiState> emit) async {
    emit(state.copyWith(onboardingUiState: event.state));
  }

  Future<void> _onDismissOnboarding(
      OnDismissOnboarding event, Emitter<ForYouUiState> emit) async {
    await _userDataRepository.setShouldHideOnboarding(true);
  }

  Future<void> _onFeedNewsStateChanged(
      OnFeedNewsStateChanged event, Emitter<ForYouUiState> emit) async {
    emit(state.copyWith(newsFeedState: event.state));
  }
}
