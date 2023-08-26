part of 'topic_bloc.dart';

sealed class TopicEvent {
  TopicEvent();
}

class _OnFollowedStateChanged extends TopicEvent {
  _OnFollowedStateChanged(this.topic);

  final FollowableTopic topic;
}

class _OnBookmarkedNewsIdsChanged extends TopicEvent {
  _OnBookmarkedNewsIdsChanged(this.followedNewsIds);

  final List<String> followedNewsIds;
}

class _OnNewsResourcesChanged extends TopicEvent {
  _OnNewsResourcesChanged(this.newsResources);

  final List<NewsResource> newsResources;
}

class _FollowedTopicsChanged extends TopicEvent {
  _FollowedTopicsChanged(this.followedTopicIds);

  final List<String> followedTopicIds;
}

class OnNewsBookMarkedStateChanged extends TopicEvent {
  final String newsResId;

  final bool isSaved;

  OnNewsBookMarkedStateChanged(
      {required this.newsResId, required this.isSaved});
}

class OnTopicFollowedStateChanged extends TopicEvent {
  final bool isFollowed;

  OnTopicFollowedStateChanged(this.isFollowed);
}
