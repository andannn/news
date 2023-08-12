
import 'package:news/core/database/dao/topic_dao.dart';

import '../model/topic.dart';

abstract class TopicsRepository {
  Stream<List<Topic>> getAllTopics();

  Stream<Topic> getTopic(String id);
}

class OfflineFirstTopicsRepository implements TopicsRepository {
  final TopicDao topicDao;

  OfflineFirstTopicsRepository({required this.topicDao});

  @override
  Stream<List<Topic>> getAllTopics() {
    final topicEntitiesStream = topicDao.getTopicEntitiesStream();
    return topicEntitiesStream.map((topicEntities) {
      return topicEntities.map((e) => Topic.fromEntity(e)).toList();
    });
  }

  @override
  Stream<Topic> getTopic(String id) {
    final topicEntityStream = topicDao.getTopicEntitiesByIdStream({id});
    return topicEntityStream.map((topicEntity) => Topic.fromEntity(topicEntity.first!));
  }
}
