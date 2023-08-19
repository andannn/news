import 'dart:async';

import 'package:news/core/data/model/topic.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/sync_utils.dart';

class TestTopicRepository extends TopicsRepository {
  StreamController<List<Topic>> controller = StreamController(sync: true);

  @override
  Stream<List<Topic>> getAllTopics() {
    return controller.stream;
  }

  @override
  Stream<Topic> getTopic(String id) {
    return controller.stream
        .map((topics) => topics.where((topic) => topic.id == id).first);
  }

  @override
  Future<bool> syncWith(Synchronizer synchronizer) {
    return Future.value(true);
  }

  void sendTopics(List<Topic> topics) {
    controller.add(topics);
  }
}
