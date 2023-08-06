import 'package:sqflite/sqflite.dart';

import '../model/news_resource_entity.dart';
import '../tables.dart';

abstract class NewsResourceDao {
  Future deleteNewsResources(List<String> ids);

  // Future insertOrIgnoreTopicCrossRefEntities(List<NewsResourceTopicCrossRef> newsResourceTopicCrossReferences)

  Future<List> insertOrIgnoreNewsResources(
      List<NewsResourceEntity> entities);

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
  Future deleteNewsResources(List<String> ids) {
    // TODO: implement deleteNewsResources
    throw UnimplementedError();
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
        '${Tables.newsResourceDaoName}(id, title, content, url, header_image_url, publish_date, type)'
        'VALUES(?, ?, ?, ?, ?, ?, ?)';
    for (final news in entities) {
      batch.rawInsert(sql, news.toJson().values.toList());
    }

    final result = await batch.commit();
    return result;
  }
}
