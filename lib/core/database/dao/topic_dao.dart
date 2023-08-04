

import '../../network/model/topic.dart';

const topicsDaoName = "topics";

abstract class TopicDao {
  Future<TopicModel> getTopicEntity(String topicId);

  Future<List<TopicModel>> getTopicEntities();

  Future<List<TopicModel>> getTopicEntitiesById(Set<String> ids);

  Future<List> insertOrIgnoreTopics(List<TopicModel> topicEntities);

  Future<void> upsertTopics(List<TopicModel> entities);

  Future<void> deleteTopics(List<String> ids);
}