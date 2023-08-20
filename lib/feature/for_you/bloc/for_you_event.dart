import 'package:equatable/equatable.dart';
import 'package:news/feature/for_you/bloc/onboarding_ui_state.dart';

sealed class ForYouPageEvent {
  const ForYouPageEvent();
}

class OnUpdateTopicSelection extends ForYouPageEvent {
  final String topicId;
  final bool isChecked;

  const OnUpdateTopicSelection(this.topicId, this.isChecked);
}

class OnBoardingUiStateChanged extends ForYouPageEvent {
  final OnboardingUiState state;

  const OnBoardingUiStateChanged(this.state);
}

class OnDismissOnboarding extends ForYouPageEvent {
  const OnDismissOnboarding();
}