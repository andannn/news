import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/data/model/followable_topic.dart';

part 'onboarding_ui_state.freezed.dart';

sealed class OnboardingUiState {}

class Loading extends OnboardingUiState {}

class LoadFailed extends OnboardingUiState {}

class NotShown extends OnboardingUiState {}

@freezed
class Shown extends OnboardingUiState with _$Shown  {
  factory Shown(List<FollowableTopic> topics) = _Shown;
}
