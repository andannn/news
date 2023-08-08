import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/database/dao/news_resource_dao.dart';

abstract class NewsRepository {
  Future<List<NewsResource>> getNewsResources(
      {Set<String> filterTopicIds = const {},
      Set<String> filterNewsIds = const {}});
}

class OfflineFirstNewsRepository extends NewsRepository {
  final NewsResourceDao newsResourceDao;

  OfflineFirstNewsRepository(this.newsResourceDao);

  @override
  Future<List<NewsResource>> getNewsResources(
      {Set<String> filterTopicIds = const {},
      Set<String> filterNewsIds = const {}}) async {
    final newsEntities = await newsResourceDao.getPopulatedNewsResource(
        useFilterNewsIds: filterNewsIds.isNotEmpty,
        filterNewsIds: filterNewsIds,
        useFilterTopicIds: filterTopicIds.isNotEmpty,
        filterTopicIds: filterTopicIds);
    return newsEntities.map((e) => NewsResource.fromEntity(e)).toList();
  }
}
