import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/database/dao/news_resource_dao.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/model/news_resource_topic_corss_ref.dart';
import 'package:news/core/database/model/topic_entity.dart';
import 'package:news/core/database/nia_database.dart';
import 'package:news/core/network/network_data_source.dart';
import 'package:news/core/shared_preference/user_data.dart';

import '../../database/model/news_resource_entity.dart';
import '../sync_utils.dart';

/// singleton of news repository.
NewsRepository newsRepository = OfflineFirstNewsRepository(
    newsResourceDao: niaDatabase.getNewsResourceDao(),
    topicDao: niaDatabase.getTopicDao(),
    networkDataSource: networkDataSource,
    niaPreferencesDataSource: niaUserDataSource);

abstract class NewsRepository implements Syncable {
  Stream<List<NewsResource>> getNewsResources(
      {Set<String> filterTopicIds = const {},
      Set<String> filterNewsIds = const {}});
}

class OfflineFirstNewsRepository extends NewsRepository {
  final NewsResourceDao newsResourceDao;
  final TopicDao topicDao;
  final NetworkDataSource networkDataSource;
  final NiaPreferencesDataSource niaPreferencesDataSource;

  OfflineFirstNewsRepository(
      {required this.newsResourceDao,
      required this.topicDao,
      required this.networkDataSource,
      required this.niaPreferencesDataSource});

  @override
  Stream<List<NewsResource>> getNewsResources(
      {Set<String> filterTopicIds = const {},
      Set<String> filterNewsIds = const {}}) {
    final newsEntitiesStream = newsResourceDao.getPopulatedNewsResourceStream(
        useFilterNewsIds: filterNewsIds.isNotEmpty,
        filterNewsIds: filterNewsIds,
        useFilterTopicIds: filterTopicIds.isNotEmpty,
        filterTopicIds: filterTopicIds);
    return newsEntitiesStream.map((list) {
      return list.map((e) => NewsResource.fromEntity(e)).toList();
    });
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
        modelUpdater: (List<String> ids) async {
          // bool hasOnboarded = niaPreferencesDataSource.shouldHideOnboarding;
          // Set<String> followedTopicIds =
          //     niaPreferencesDataSource.followedTopics;

          // if (isFirstSync) {
          //   // When we first retrieve news, mark everything viewed, so that we aren't
          //   // overwhelmed with all historical news.
          //   niaPreferencesDataSource.setNewsResourcesViewed(changedIds, true)
          // }

          final networkNewsResources =
              await networkDataSource.getNewsResources(ids: ids);

          await topicDao.insertOrIgnoreTopics(networkNewsResources
              .map((e) => TopicEntity.fromNewsDto(e))
              .expand((list) => list)
              .toSet()
              .toList());

          await newsResourceDao.upsertNewsResources(
            networkNewsResources
                .map((res) => NewsResourceEntity.fromDto(res))
                .toSet()
                .toList(),
          );

          await newsResourceDao.insertOrIgnoreTopicCrossRefEntities(
            networkNewsResources
                .map((res) => NewsResourceTopicCrossRef.fromDto(res))
                .expand((list) => list)
                .toSet()
                .toList(),
          );
        }

        // if (hasOnboarded) {}
        );
  }
}
