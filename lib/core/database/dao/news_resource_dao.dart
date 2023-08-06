import 'package:sqflite/sqflite.dart';

import '../model/news_resource_entity.dart';
import '../model/news_resource_topic_corss_ref.dart';
import '../tables.dart';

abstract class NewsResourceDao {
  /// Delete rows in news_resource table by ids.
  /// Returns the deleted count.
  Future deleteNewsResources(List<String> ids);

  Future insertOrIgnoreTopicCrossRefEntities(
      List<NewsResourceTopicCrossRef> newsResourceTopicCrossReferences);

  Future<List> insertOrIgnoreNewsResources(List<NewsResourceEntity> entities);

  Future<List<String>> getNewsResourceIds({
    bool useFilterTopicIds = false,
    Set<String> filterTopicIds = const {},
    bool useFilterNewsIds = false,
    Set<String> filterNewsIds = const {},
  });

//
// Future<List<PopulatedNewsResource>> getNewsResourceIds({
//   bool useFilterTopicIds = false,
//   Set<String> filterTopicIds = const {},
//   bool useFilterNewsIds = false,
//   Set<String> filterNewsIds = const {},
// });
}

class NewsResourceDaoImpl implements NewsResourceDao {
  final Database _niaDatabase;

  NewsResourceDaoImpl(this._niaDatabase);

  @override
  Future deleteNewsResources(List<String> ids) async {
    final batch = _niaDatabase.batch();
    for (final id in ids) {
      batch.delete(Tables.newsResource, where: 'id = ?', whereArgs: [id]);
    }
    List<Object?> result = await batch.commit();
    return result.whereType<int>().where((res) => res != 0).toList();
  }

  @override
  Future<List<String>> getNewsResourceIds(
      {bool useFilterTopicIds = false,
      Set<String> filterTopicIds = const {},
      bool useFilterNewsIds = false,
      Set<String> filterNewsIds = const {}}) {
    // TODO: implement getNewsResourceIds
    throw UnimplementedError();
  }

  @override
  Future<List> insertOrIgnoreNewsResources(
      List<NewsResourceEntity> entities) async {
    final batch = _niaDatabase.batch();

    final sql = 'INSERT OR IGNORE INTO '
        '${Tables.newsResource}(id, title, content, url, header_image_url, publish_date, type)'
        'VALUES(?, ?, ?, ?, ?, ?, ?)';
    for (final news in entities) {
      batch.rawInsert(sql, news.toJson().values.toList());
    }

    final result = await batch.commit();
    return result;
  }

  @override
  Future insertOrIgnoreTopicCrossRefEntities(
      List<NewsResourceTopicCrossRef> newsResourceTopicCrossRefList) async {
    final batch = _niaDatabase.batch();

    final sql = 'INSERT OR IGNORE INTO '
        '${Tables.newsResourceTopicCrossRef}(news_resource_id, topic_id)'
        'VALUES(?, ?)';
    for (final crossRef in newsResourceTopicCrossRefList) {
      batch.rawInsert(sql, crossRef.toJson().values.toList());
    }

    await batch.commit();
  }
}
