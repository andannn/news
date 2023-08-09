import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/database/dao/news_resource_dao.dart';
import 'package:news/core/network/network_data_source.dart';

import '../sync_utils.dart';

abstract class NewsRepository implements Syncable {
  Future<List<NewsResource>> getNewsResources(
      {Set<String> filterTopicIds = const {},
      Set<String> filterNewsIds = const {}});
}

class OfflineFirstNewsRepository extends NewsRepository {
  final NewsResourceDao newsResourceDao;
  final NetworkDataSource networkDataSource;

  OfflineFirstNewsRepository(this.newsResourceDao, this.networkDataSource);

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

  @override
  Future<bool> syncWith(Synchronizer synchronizer) {
    var isFirstSync = false;
    return synchronizer.changeListSync(
        versionReader: (ChangeListVersions currentChangeListVersion) =>
            currentChangeListVersion.newsResourceVersion,
        changeListFetcher: (int version) async {
          isFirstSync = version <= 0;
          return networkDataSource.getNewsResourceChangeList(after: version);
        },
        versionUpdater: (ChangeListVersions lastVersion, int newVersion) {
          return ChangeListVersions(
              newsResourceVersion: newVersion,
              topicVersion: lastVersion.topicVersion);
        },
        modelDeleter: (List<String> ids) async {
          await newsResourceDao.deleteNewsResources(ids);
        },
        modelUpdater: (List<String> ids) async {});
  }
}
