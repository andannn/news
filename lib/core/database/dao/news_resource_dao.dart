import 'package:news/core/database/model/topic_entity.dart';
import 'package:news/core/database/nia_database.dart';
import 'package:sqflite/sqflite.dart';

import '../model/news_resource_entity.dart';
import '../model/news_resource_topic_corss_ref.dart';
import '../model/populated_news_resource.dart';
import '../tables.dart';

abstract class NewsResourceDao {
  /// Delete rows in news_resource table by ids.
  /// Returns the deleted count.
  Future deleteNewsResources(List<String> ids);

  Future insertOrIgnoreTopicCrossRefEntities(
      List<NewsResourceTopicCrossRef> newsResourceTopicCrossReferences);

  Future<List> insertOrIgnoreNewsResources(List<NewsResourceEntity> entities);

  Future<List> upsertNewsResources(List<NewsResourceEntity> entities);

  Stream<List<String>> getNewsResourceIdsStream({
    bool useFilterTopicIds = false,
    Set<String> filterTopicIds = const {},
    bool useFilterNewsIds = false,
    Set<String> filterNewsIds = const {},
  });

  Stream<List<PopulatedNewsResource>> getPopulatedNewsResourceStream({
    bool useFilterTopicIds = false,
    Set<String> filterTopicIds = const {},
    bool useFilterNewsIds = false,
    Set<String> filterNewsIds = const {},
  });
}

class NewsResourceDaoImpl implements NewsResourceDao {
  NewsResourceDaoImpl(this._niaDatabase, this.onTableUpdated);

  final NiaDatabase _niaDatabase;

  Database get _database => _niaDatabase.niaDB!;
  final Function(String table) onTableUpdated;

  @override
  Future deleteNewsResources(List<String> ids) async {
    final batch = _database.batch();
    for (final id in ids) {
      batch.delete(Tables.newsResource, where: 'id = ?', whereArgs: [id]);
    }
    List<Object?> result = await batch.commit();
    onTableUpdated(Tables.newsResource);
    return result.whereType<int>().where((res) => res != 0).toList();
  }

  Future<List<PopulatedNewsResource>> getPopulatedNewsResource(
      {bool useFilterTopicIds = false,
      Set<String> filterTopicIds = const {},
      bool useFilterNewsIds = false,
      Set<String> filterNewsIds = const {}}) async {
    final newsIds = await getNewsResourceIds(
        useFilterTopicIds: useFilterTopicIds,
        filterTopicIds: filterTopicIds,
        useFilterNewsIds: useFilterNewsIds,
        filterNewsIds: filterNewsIds);

    List<PopulatedNewsResource> ret = [];
    for (final id in newsIds) {
      ret.add(await _mapNewsIdToPopulatedNewsResource(id));
    }
    return ret;
  }

  Future<List<String>> getNewsResourceIds(
      {bool useFilterTopicIds = false,
      Set<String> filterTopicIds = const {},
      bool useFilterNewsIds = false,
      Set<String> filterNewsIds = const {}}) async {
    String sql = """
            SELECT id FROM news_resources
            WHERE 
                CASE WHEN $useFilterNewsIds
                    THEN id IN (${filterNewsIds.join(', ')})
                    ELSE 1
                END
             AND
                CASE WHEN $useFilterTopicIds
                    THEN id IN
                        (
                            SELECT news_resource_id FROM news_resources_topics
                            WHERE topic_id IN (${filterTopicIds.join(', ')})
                        )
                    ELSE 1
                END
            ORDER BY publish_date DESC
    """;
    final res = await _database.rawQuery(sql);
    return res.map((element) => element['id'].toString()).toList();
  }

  @override
  Future<List> insertOrIgnoreNewsResources(
      List<NewsResourceEntity> entities) async {
    final batch = _database.batch();

    final sql = 'INSERT OR IGNORE INTO '
        '${Tables.newsResource}(id, title, content, url, header_image_url, publish_date, type)'
        'VALUES(?, ?, ?, ?, ?, ?, ?)';
    for (final news in entities) {
      batch.rawInsert(sql, news.toJson().values.toList());
    }

    final result = await batch.commit();
    onTableUpdated(Tables.newsResource);
    return result;
  }

  @override
  Future<List> upsertNewsResources(List<NewsResourceEntity> entities) async {
    final batch = _database.batch();

    final sql = 'INSERT OR REPLACE INTO '
        '${Tables.newsResource}(id, title, content, url, header_image_url, publish_date, type)'
        'VALUES(?, ?, ?, ?, ?, ?, ?)';
    for (final news in entities) {
      batch.rawInsert(sql, news.toJson().values.toList());
    }

    final result = await batch.commit();
    onTableUpdated(Tables.newsResource);
    return result;
  }

  @override
  Future insertOrIgnoreTopicCrossRefEntities(
      List<NewsResourceTopicCrossRef> newsResourceTopicCrossRefList) async {
    final batch = _database.batch();

    final sql = 'INSERT OR IGNORE INTO '
        '${Tables.newsResourceTopicCrossRef}(news_resource_id, topic_id)'
        'VALUES(?, ?)';
    for (final crossRef in newsResourceTopicCrossRefList) {
      batch.rawInsert(sql, crossRef.toJson().values.toList());
    }
    await batch.commit();

    onTableUpdated(Tables.newsResourceTopicCrossRef);
  }

  Future<PopulatedNewsResource> _mapNewsIdToPopulatedNewsResource(
      String newsId) async {
    final newsJson = await _database.query(Tables.newsResource,
        where: 'id = $newsId', limit: 1);
    NewsResourceEntity entity = NewsResourceEntity.fromJson(newsJson.first);

    String sql = """
            SELECT * FROM ${Tables.topics}
            WHERE  id IN
                (
                  SELECT topic_id FROM news_resources_topics
                  WHERE news_resource_id = $newsId
                )
    """;
    List topicsJson = await _database.rawQuery(sql);
    final topics = topicsJson.map((e) => TopicEntity.fromJson(e)).toList();
    return PopulatedNewsResource(entity: entity, topics: topics);
  }

  @override
  Stream<List<String>> getNewsResourceIdsStream(
      {bool useFilterTopicIds = false,
      Set<String> filterTopicIds = const {},
      bool useFilterNewsIds = false,
      Set<String> filterNewsIds = const {}}) {
    return _niaDatabase.createStream(() => getNewsResourceIds(
        useFilterTopicIds: useFilterTopicIds,
        filterTopicIds: filterTopicIds,
        useFilterNewsIds: useFilterNewsIds,
        filterNewsIds: filterNewsIds));
  }

  @override
  Stream<List<PopulatedNewsResource>> getPopulatedNewsResourceStream(
      {bool useFilterTopicIds = false,
      Set<String> filterTopicIds = const {},
      bool useFilterNewsIds = false,
      Set<String> filterNewsIds = const {}}) {
    return _niaDatabase.createStream(() => getPopulatedNewsResource(
        useFilterTopicIds: useFilterTopicIds,
        filterTopicIds: filterTopicIds,
        useFilterNewsIds: useFilterNewsIds,
        filterNewsIds: filterNewsIds));
  }
}
