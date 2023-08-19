import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/feature/for_you/bloc/onboarding_ui_state.dart';

part 'for_you_ui_state.freezed.dart';

@freezed
class ForYouUiState with _$ForYouUiState {
  factory ForYouUiState(OnboardingUiState onboardingUiState) =
      _ForYouUiState;
}
