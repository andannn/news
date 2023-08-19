import 'package:equatable/equatable.dart';
import 'package:news/core/data/model/followable_topic.dart';

sealed class OnboardingUiState extends Equatable {
  const OnboardingUiState();
}

class Loading extends OnboardingUiState {
  @override
  List<Object?> get props => [];
}

class LoadFailed extends OnboardingUiState {
  @override
  List<Object?> get props => [];
}

class NotShown extends OnboardingUiState {
  @override
  List<Object?> get props => [];
}

class Shown extends OnboardingUiState {
  final List<FollowableTopic> topics;

  const Shown(this.topics);

  @override
  List<Object?> get props => [topics];
}
