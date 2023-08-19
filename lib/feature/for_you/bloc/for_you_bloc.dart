import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:news/feature/for_you/bloc/for_you_event.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';
import 'package:news/feature/for_you/bloc/onboarding_ui_state.dart';

class ForYouBloc extends Bloc<ForYouPageEvent, ForYouUiState> {
  ForYouBloc(
      {required UserDataRepository userDataRepository,
      required GetFollowableTopicsUseCase getFollowableTopicsUseCase})
      : super(ForYouUiState(Loading())) {
    on<OnUpdateTopicSelection>(_onUpdateTopicSelection);
  }

  Future<void> _onUpdateTopicSelection(
      OnUpdateTopicSelection event, Emitter<ForYouUiState> emit) async {

  }
}
