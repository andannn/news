import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:news/feature/interests/bloc/interests_ui_state.dart';

part 'interests_event.dart';

class InterestBloc extends Bloc<InterestEvent, InterestsUiState> {
  InterestBloc(
      {required UserDataRepository userDataRepository,
      required GetFollowableTopicsUseCase getFollowableTopicsUseCase})
      : _userDataRepository = userDataRepository,
        super(InterestsUiState()) {
    on<_OnFollowableTopicChanged>(_onFollowableTopicChanged);
    on<OnUpdateTopicSelection>(_onUpdateTopicSelection);

    _followableTopicsSub = getFollowableTopicsUseCase.invoke().listen((topics) {
      add(_OnFollowableTopicChanged(topics));
    });
  }

  final UserDataRepository _userDataRepository;

  StreamSubscription<List<FollowableTopic>>? _followableTopicsSub;

  @override
  Future<void> close() async {
    super.close();
    _followableTopicsSub?.cancel();
  }

  Future<void> _onFollowableTopicChanged(
      _OnFollowableTopicChanged event, Emitter<InterestsUiState> emit) async {
    emit(state.copyWith(topics: event.topics));
  }

  Future<void> _onUpdateTopicSelection(
      OnUpdateTopicSelection event, Emitter<InterestsUiState> emit) async {
    _userDataRepository.toggleFollowedTopicId(
        topicId: event.topicId, followed: event.isChecked);
  }
}
