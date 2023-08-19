import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news/common/log_util.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:news/feature/for_you/bloc/for_you_event.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';
import 'package:news/feature/for_you/bloc/onboarding_ui_state.dart';
import 'package:rxdart/streams.dart';

class ForYouBloc extends Bloc<ForYouPageEvent, ForYouUiState> {
  ForYouBloc(
      {required UserDataRepository userDataRepository,
      required GetFollowableTopicsUseCase getFollowableTopicsUseCase})
      : _userDataRepository = userDataRepository,
        super(ForYouUiState(Loading())) {
    on<OnUpdateTopicSelection>(_onUpdateTopicSelection);
    on<OnBoardingUiStateChanged>(_onBoardingUiStateChanged);

    Stream<bool> shouldHideOnBoardingStream =
        userDataRepository.getShouldHideOnboardingStream();
    Stream<List<FollowableTopic>> followableTopicsStream =
        getFollowableTopicsUseCase.invoke();

    Stream<OnboardingUiState> onboardingUiStateStream =
        CombineLatestStream.combine2(shouldHideOnBoardingStream,
                followableTopicsStream, _getOnboardingUiState)
            .distinct();

    _onboardingUiStateSub = onboardingUiStateStream.listen((event) {
      add(OnBoardingUiStateChanged(event));
    });
  }

  final UserDataRepository _userDataRepository;

  StreamSubscription<OnboardingUiState>? _onboardingUiStateSub;

  @override
  Future<void> close() async {
    super.close();
    _onboardingUiStateSub?.cancel();
  }

  @override
  void onChange(Change<ForYouUiState> change) {
    super.onChange(change);

    logUtil('ForYouBloc data change to :$change');
  }

  Future<void> _onUpdateTopicSelection(
      OnUpdateTopicSelection event, Emitter<ForYouUiState> emit) async {
    await _userDataRepository.toggleFollowedTopicId(
        topicId: event.topicId, followed: event.isChecked);
  }

  OnboardingUiState _getOnboardingUiState(
      bool shouldHideOnBoarding, List<FollowableTopic> followableTopics) {
    if (shouldHideOnBoarding) {
      return NotShown();
    } else {
      return Shown(followableTopics);
    }
  }

  Future<void> _onBoardingUiStateChanged(
      OnBoardingUiStateChanged event, Emitter<ForYouUiState> emit) async {
    emit(state.copyWith(onboardingUiState: event.state));
  }
}
