part of 'for_you_bloc.dart';

sealed class ForYouPageEvent {
  const ForYouPageEvent();
}

class OnUpdateTopicSelection extends ForYouPageEvent {
  final String topicId;
  final bool isChecked;

  const OnUpdateTopicSelection(this.topicId, this.isChecked);
}

class OnDismissOnboarding extends ForYouPageEvent {
  const OnDismissOnboarding();
}

class OnNewsBookMarkedStateChanged extends ForYouPageEvent {
  final String newsResId;

  final bool isSaved;

  OnNewsBookMarkedStateChanged(
      {required this.newsResId, required this.isSaved});
}

class _OnFeedNewsStateChanged extends ForYouPageEvent {
  final NewsFeedState state;

  const _OnFeedNewsStateChanged(this.state);
}

class _OnBoardingUiStateChanged extends ForYouPageEvent {
  final OnboardingUiState state;

  const _OnBoardingUiStateChanged(this.state);
}

class _OnBookmarkedNewsChanged extends ForYouPageEvent {
  final List<String> bookmarkedNewsIds;

  const _OnBookmarkedNewsChanged(this.bookmarkedNewsIds);
}

class _OnFollowedTopicChanged extends ForYouPageEvent {
  final List<String> topics;

  const _OnFollowedTopicChanged(this.topics);
}
