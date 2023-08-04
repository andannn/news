
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/model/topic.dart';
import 'package:sqflite/sqflite.dart';

class TopicDaoImpl implements TopicDao {

  final Database _niaDatabase;

  TopicDaoImpl(this._niaDatabase);

  @override
  Future<void> deleteTopics(List<String> ids) {
    // TODO: implement deleteTopics
    throw UnimplementedError();
  }

  @override
  Future<List<TopicModel>> getTopicEntities() {
    // TODO: implement getTopicEntities
    throw UnimplementedError();
  }

  @override
  Future<List<TopicModel>> getTopicEntitiesById(Set<String> ids) {
    // TODO: implement getTopicEntitiesById
    throw UnimplementedError();
  }

  @override
  Future<TopicModel> getTopicEntity(String topicId) {
    // TODO: implement getTopicEntity
    throw UnimplementedError();
  }

  @override
  Future<List> insertOrIgnoreTopics(List<TopicModel> topicEntities) async {
    final batch = _niaDatabase.batch();

    for (var topic in topicEntities) {
      batch.insert(topicsDaoName, topic.toJson());
    }

    final result = await batch.commit();
    return result;
  }

  @override
  Future<void> upsertTopics(List<TopicModel> entities) {
    // TODO: implement upsertTopics
    throw UnimplementedError();
  }
}