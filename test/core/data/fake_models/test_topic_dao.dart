import 'dart:async';

import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/model/topic_entity.dart';

class TestTopicDao implements TopicDao {
  StreamController<List<TopicEntity>> controller = StreamController();

  Stream<List<TopicEntity>> get entitiesStateStream => controller.stream;
  List<TopicEntity> _current = [];

  TestTopicDao() {
    controller.add([]);
  }

  @override
  Future<List<int>> deleteTopics(List<String> ids) {
    // TODO: implement deleteTopics
    throw UnimplementedError();
  }

  @override
  Stream<List<TopicEntity>> getTopicEntitiesStream() {
    return entitiesStateStream;
  }

  @override
  Stream<TopicEntity?> getTopicEntityStream(String topicId) {
    throw UnimplementedError();
  }

  @override
  Future<List> insertOrIgnoreTopics(List<TopicEntity> topicEntities) async {
    _current = (_current + topicEntities).toSet().toList();
    controller.add(_current);
    return topicEntities.map((e) => e.id).toList();
  }

  @override
  Future<void> upsertTopics(List<TopicEntity> entities) async {
    _current = (_current + entities).toSet().toList();
    controller.add(_current);
  }

  @override
  Stream<List<TopicEntity?>> getTopicEntitiesByIdStream(Set<String> ids) {
    return entitiesStateStream.map((entities) =>
        entities.where((entity) => ids.contains(entity.id.toString())).toList());
  }
}
