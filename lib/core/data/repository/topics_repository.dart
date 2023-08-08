
import 'package:news/core/database/dao/topic_dao.dart';

import '../model/topic.dart';

abstract class TopicsRepository {
  Future<List<Topic>> getAllTopics();

  Future<Topic?> getTopic(String id);
}

class OfflineFirstTopicsRepository implements TopicsRepository {
  final TopicDao topicDao;

  OfflineFirstTopicsRepository({required this.topicDao});

  @override
  Future<List<Topic>> getAllTopics() async {
    final topicEntities = await topicDao.getTopicEntities();
    return topicEntities.map((e) => Topic.fromEntity(e)).toList();
  }

  @override
  Future<Topic?> getTopic(String id) async {
    final topicEntityList = await topicDao.getTopicEntitiesById({id});
    final topicEntityNullable = topicEntityList.firstOrNull;
    if (topicEntityNullable == null) {
      return null;
    } else {
      return Topic.fromEntity(topicEntityNullable);
    }
  }
}
