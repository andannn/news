import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/feature/for_you/bloc/onboarding_ui_state.dart';

import 'news_feed_state.dart';

part 'for_you_ui_state.freezed.dart';

@freezed
class ForYouUiState with _$ForYouUiState {
  factory ForYouUiState(
      {@Default(OnboardingLoading()) OnboardingUiState onboardingUiState,
      @Default(NewsFeedLoading()) NewsFeedState newsFeedState,
      @Default([]) List<String> bookmarkedNewsIds,
      @Default([]) List<String> followedTopicIds}) = _ForYouUiState;
}
