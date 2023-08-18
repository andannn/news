import 'package:news/core/data/model/followable_topic.dart';

sealed class OnboardingUiState {}

class Loading extends OnboardingUiState {}

class LoadFailed extends OnboardingUiState {}

class NotShown extends OnboardingUiState {}

class Shown extends OnboardingUiState {
  final List<FollowableTopic> topics;

  Shown(this.topics);
}
