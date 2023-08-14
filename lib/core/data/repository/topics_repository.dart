import 'package:news/core/data/sync_utils.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/model/topic_entity.dart';
import 'package:news/core/network/network_data_source.dart';

import '../model/topic.dart';

abstract class TopicsRepository extends Syncable {
  Stream<List<Topic>> getAllTopics();

  Stream<Topic> getTopic(String id);
}

class OfflineFirstTopicsRepository implements TopicsRepository {
  final TopicDao topicDao;
  final NetworkDataSource networkDataSource;

  OfflineFirstTopicsRepository(
      {required this.topicDao, required this.networkDataSource});

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
    return topicEntityStream
        .map((topicEntity) => Topic.fromEntity(topicEntity.first!));
  }

  @override
  Future<bool> syncWith(Synchronizer synchronizer) {
    return synchronizer.changeListSync(
        versionReader: (ChangeListVersions currentChangeListVersion) =>
            currentChangeListVersion.topicVersion,
        changeListFetcher: (int version) async {
          return networkDataSource.getTopicChangeList(version);
        },
        versionUpdater: (ChangeListVersions lastVersion, int newVersion) {
          return ChangeListVersions(
              newsResourceVersion: lastVersion.newsResourceVersion,
              topicVersion: newVersion);
        },
        modelDeleter: (List<String> ids) async {
          await topicDao.deleteTopics(ids);
        },
        modelUpdater: (List<String> ids) async {
          final networkTopics = await networkDataSource.getTopics(ids: ids);
          await topicDao.upsertTopics(
              networkTopics.map((e) => TopicEntity.fromTopicDto(e)).toList());
        });
  }
}
