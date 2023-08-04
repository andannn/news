import 'package:news/core/database/dao/topic_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../model/topic_entity.dart';
import '../tables.dart';

class TopicDaoImpl implements TopicDao {
  final Database _niaDatabase;

  TopicDaoImpl(this._niaDatabase);

  @override
  Future<void> deleteTopics(List<String> ids) {
    // TODO: implement deleteTopics
    throw UnimplementedError();
  }

  @override
  Future<List<TopicEntity>> getTopicEntities() {
    // TODO: implement getTopicEntities
    throw UnimplementedError();
  }

  @override
  Future<List<TopicEntity>> getTopicEntitiesById(Set<String> ids) {
    // TODO: implement getTopicEntitiesById
    throw UnimplementedError();
  }

  @override
  Future<TopicEntity> getTopicEntity(String topicId) {
    // TODO: implement getTopicEntity
    throw UnimplementedError();
  }

  @override
  Future<List> insertOrIgnoreTopics(List<TopicEntity> topicEntities) async {
    final batch = _niaDatabase.batch();

    final sql = 'INSERT OR IGNORE INTO '
        '${Tables.topicsDaoName}(id, name, shortDescription, longDescription, url, imageUrl)'
        'VALUES(?, ?, ?, ?, ?, ?)';
    for (var topic in topicEntities) {
      batch.rawInsert(sql, topic.toJson().values.toList());
    }

    final result = await batch.commit();
    return result;
  }

  @override
  Future<void> upsertTopics(List<TopicEntity> entities) {
    // TODO: implement upsertTopics
    throw UnimplementedError();
  }
}
