part of 'interests_bloc.dart';

sealed class InterestEvent {
  const InterestEvent();
}

class _OnFollowableTopicChanged extends InterestEvent {
  const _OnFollowableTopicChanged(this.topics);

  final List<FollowableTopic> topics;
}

class OnUpdateTopicSelection extends InterestEvent {
  final String topicId;
  final bool isChecked;

  const OnUpdateTopicSelection(this.topicId, this.isChecked);
}

