

import 'dart:async';

import 'package:news/core/database/model/topic_entity.dart';
import 'package:news/core/database/nia_database.dart';
import 'package:sqflite/sqflite.dart';

import '../tables.dart';

abstract class TopicDao {
  Stream<TopicEntity?> getTopicEntityStream(String topicId);

  Future<TopicEntity?> getTopicEntity(String topicId);

  Future<List<TopicEntity>> getTopicEntities();

  Stream<List<TopicEntity>> getTopicEntitiesStream();

  Future<List<TopicEntity?>> getTopicEntitiesById(Set<String> ids);

  Future<List> insertOrIgnoreTopics(List<TopicEntity> topicEntities);

  Future<void> upsertTopics(List<TopicEntity> entities);

  Future<List<int>> deleteTopics(List<String> ids);
}

class TopicDaoImpl implements TopicDao {
  TopicDaoImpl(this._niaDataBase, this.onTableUpdated);

  final NiaDatabase _niaDataBase;
  Database get _dataBase => _niaDataBase.niaDB!;

  final Function(String table) onTableUpdated;

  @override
  Future<List<int>> deleteTopics(List<String> ids) async {
    final batch = _dataBase.batch();
    for (final id in ids) {
      batch.delete(Tables.topics, where: 'id = ?', whereArgs: [id]);
    }
    List<Object?> result = await batch.commit();
    onTableUpdated.call(Tables.topics);
    return result.whereType<int>().where((res) => res != 0).toList();
  }

  @override
  Stream<List<TopicEntity>> getTopicEntitiesStream() {
    return _niaDataBase.createStream(getTopicEntities);
  }

  @override
  Future<List<TopicEntity>> getTopicEntities() async {
    List<Map<String, dynamic>> maps =
    await _dataBase.query(Tables.topics);

    return maps.map((topicJson) => TopicEntity.fromJson(topicJson)).toList();
  }

  @override
  Future<List<TopicEntity?>> getTopicEntitiesById(Set<String> ids) async {
    TopicEntity? mapToTopicEntity(json) {
      final jsonElement = (json as List).firstOrNull;

      if (jsonElement != null) {
        return TopicEntity.fromJson(jsonElement);
      } else {
        return null;
      }
    }

    final batch = _dataBase.batch();
    for (final id in ids) {
      batch.query(Tables.topics,
          where: 'id = ?', whereArgs: [id], limit: 1);
    }
    List<dynamic> results = await batch.commit();

    return results.map(mapToTopicEntity).toList();
  }

  @override
  Stream<TopicEntity?> getTopicEntityStream(String topicId) {
    return _niaDataBase.createStream(() => getTopicEntity(topicId));
  }

  @override
  Future<TopicEntity?> getTopicEntity(String topicId) async {
    List<Map<String, dynamic>> maps = await _dataBase
        .query(Tables.topics, where: 'id = ?', whereArgs: [topicId]);

    if (maps.isNotEmpty) {
      return TopicEntity.fromJson(maps.first);
    }
    return null;
  }

  @override
  Future<List> insertOrIgnoreTopics(List<TopicEntity> topicEntities) async {
    final batch = _dataBase.batch();

    final sql = 'INSERT OR IGNORE INTO '
        '${Tables.topics}(id, name, shortDescription, longDescription, url, imageUrl)'
        'VALUES(?, ?, ?, ?, ?, ?)';
    for (var topic in topicEntities) {
      batch.rawInsert(sql, topic.toJson().values.toList());
    }

    final result = await batch.commit();
    onTableUpdated.call(Tables.topics);
    return result;
  }

  @override
  Future<void> upsertTopics(List<TopicEntity> entities) async {
    final batch = _dataBase.batch();

    final sql = 'INSERT OR REPLACE INTO '
        '${Tables.topics}(id, name, shortDescription, longDescription, url, imageUrl)'
        'VALUES(?, ?, ?, ?, ?, ?)';
    for (var topic in entities) {
      batch.rawInsert(sql, topic.toJson().values.toList());
    }

    onTableUpdated.call(Tables.topics);
    await batch.commit();
  }
}
