import 'package:news/core/database/dao/topic_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../model/topic_entity.dart';
import '../tables.dart';

class TopicDaoImpl implements TopicDao {
  final Database _niaDatabase;

  TopicDaoImpl(this._niaDatabase);

  @override
  Future<List<int>> deleteTopics(List<String> ids) async {
    final batch = _niaDatabase.batch();
    for (final id in ids) {
      batch.delete(Tables.topicsDaoName, where: 'id = ?', whereArgs: [id]);
    }
    List<Object?> result = await batch.commit();
    return result.whereType<int>().where((res) => res != 0).toList();
  }

  @override
  Future<List<TopicEntity>> getTopicEntities() async {
    List<Map<String, dynamic>> maps =
        await _niaDatabase.query(Tables.topicsDaoName);

    return maps.map((topicJson) => TopicEntity.fromJson(topicJson)).toList();
  }

  @override
  Future<List<TopicEntity>> getTopicEntitiesById(Set<String> ids) {
    // TODO: implement getTopicEntitiesById
    throw UnimplementedError();
  }

  @override
  Future<TopicEntity?> getTopicEntity(String topicId) async {
    List<Map<String, dynamic>> maps = await _niaDatabase
        .query(Tables.topicsDaoName, where: 'id = ?', whereArgs: [topicId]);

    if (maps.isNotEmpty) {
      return TopicEntity.fromJson(maps.first);
    }
    return null;
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
  Future<void> upsertTopics(List<TopicEntity> entities) async {
    final batch = _niaDatabase.batch();

    final sql = 'INSERT OR REPLACE INTO '
        '${Tables.topicsDaoName}(id, name, shortDescription, longDescription, url, imageUrl)'
        'VALUES(?, ?, ?, ?, ?, ?)';
    for (var topic in entities) {
      batch.rawInsert(sql, topic.toJson().values.toList());
    }

    await batch.commit();
  }
}
