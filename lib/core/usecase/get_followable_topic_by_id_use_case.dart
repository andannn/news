import 'dart:async';

import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/topic.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:rxdart/streams.dart';

GetFollowableTopicByIdUseCase createGetFollowableTopicByIdUseCase() =>
    GetFollowableTopicByIdUseCase(topicsRepository, userDataRepository);

class GetFollowableTopicByIdUseCase {
  GetFollowableTopicByIdUseCase(this.topicsRepository, this.userDataRepository);

  final TopicsRepository topicsRepository;
  final UserDataRepository userDataRepository;

  Stream<FollowableTopic> invoke(String topicId) {
    final topicStream = topicsRepository.getTopic(topicId);
    final followedTopicsStream = userDataRepository.getFollowedTopicIdsStream();
    return CombineLatestStream.combine2(topicStream, followedTopicsStream,
        (topic, followedTopics) => _combineValues(topic, followedTopics));
  }

  FollowableTopic _combineValues(
      Topic topic, List<String> followedTopics) {
    return FollowableTopic(topic, followedTopics.contains(topic.id));
  }
}
