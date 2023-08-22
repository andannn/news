import 'dart:async';

import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/topic.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:rxdart/streams.dart';

GetFollowableTopicsUseCase createGetFollowableTopicsUseCase() =>
    GetFollowableTopicsUseCase(topicsRepository, userDataRepository);

class GetFollowableTopicsUseCase {
  GetFollowableTopicsUseCase(this.topicsRepository, this.userDataRepository);

  final TopicsRepository topicsRepository;
  final UserDataRepository userDataRepository;

  Stream<List<FollowableTopic>> invoke() {
    final topicsStream = topicsRepository.getAllTopics();
    final followedTopicsStream = userDataRepository.getFollowedTopicIdsStream();
    return CombineLatestStream.combine2(topicsStream, followedTopicsStream,
        (topics, followedTopics) => _combineValues(topics, followedTopics));
  }

  List<FollowableTopic> _combineValues(
      List<Topic> topics, List<String> followedTopics) {
    final followableTopics = topics
        .map((topic) =>
            FollowableTopic(topic, followedTopics.contains(topic.id)))
        .toList();
    return followableTopics;
  }
}
