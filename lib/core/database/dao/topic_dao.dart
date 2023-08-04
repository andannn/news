

import 'package:news/core/database/model/topic_entity.dart';


abstract class TopicDao {
  Future<TopicEntity?> getTopicEntity(String topicId);

  Future<List<TopicEntity>> getTopicEntities();

  Future<List<TopicEntity>> getTopicEntitiesById(Set<String> ids);

  Future<List> insertOrIgnoreTopics(List<TopicEntity> topicEntities);

  Future<void> upsertTopics(List<TopicEntity> entities);

  Future<List<int>> deleteTopics(List<String> ids);
}