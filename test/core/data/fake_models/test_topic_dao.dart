import 'dart:async';

import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/model/topic_entity.dart';

class TestTopicDao implements TopicDao {

  List<TopicEntity> _current = [];

  @override
  Future<List<int>> deleteTopics(List<String> ids) {
    // TODO: implement deleteTopics
    throw UnimplementedError();
  }

  @override
  Stream<List<TopicEntity>> getTopicEntitiesStream() {
    return Stream.value(_current);
  }

  @override
  Stream<TopicEntity?> getTopicEntityStream(String topicId) {
    throw UnimplementedError();
  }

  @override
  Future<List> insertOrIgnoreTopics(List<TopicEntity> topicEntities) async {
    _current = (_current + topicEntities).toSet().toList();
    return topicEntities.map((e) => e.id).toList();
  }

  @override
  Future<void> upsertTopics(List<TopicEntity> entities) async {
    _current = (_current + entities).toSet().toList();
  }

  @override
  Stream<List<TopicEntity?>> getTopicEntitiesByIdStream(Set<String> ids) {
    return Stream.value(_current).map((entities) =>
        entities.where((entity) => ids.contains(entity.id.toString())).toList());
  }
}
