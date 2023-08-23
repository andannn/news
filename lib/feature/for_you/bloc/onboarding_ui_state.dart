import 'package:equatable/equatable.dart';
import 'package:news/core/data/model/followable_topic.dart';

sealed class OnboardingUiState extends Equatable {
  const OnboardingUiState();
}

class OnboardingLoading extends OnboardingUiState {
  const OnboardingLoading();

  @override
  List<Object?> get props => [];
}

class OnboardingLoadFailed extends OnboardingUiState {
  @override
  List<Object?> get props => [];
}

class OnboardingNotShown extends OnboardingUiState {
  @override
  List<Object?> get props => [];
}

class OnboardingShown extends OnboardingUiState {
  final List<FollowableTopic> topics;

  const OnboardingShown(this.topics);

  @override
  List<Object?> get props => [topics];
}
