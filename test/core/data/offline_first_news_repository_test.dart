import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/sync_utils.dart';
import 'package:news/core/database/model/news_resource_entity.dart';
import 'package:news/core/database/model/news_resource_topic_corss_ref.dart';
import 'package:news/core/database/model/topic_entity.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_models/test_news_dao.dart';
import 'fake_models/test_nia_network_data_source.dart';
import 'fake_models/test_topic_dao.dart';
import 'test_synchronizer.dart';

void main() {
  group('shared_preference_test', () {
    late NiaPreferencesDataSource preference;
    late OfflineFirstNewsRepository subject;
    late TestNewsDao newsResourceDao;
    late TestTopicDao topicDao;
    late TestNiaNetworkDataSource network;
    late Synchronizer synchronizer;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      preference = NiaPreferencesDataSource();

      network = TestNiaNetworkDataSource();
      await network.init();

      newsResourceDao = TestNewsDao();
      topicDao = TestTopicDao();
      subject = OfflineFirstNewsRepository(
          newsResourceDao: newsResourceDao,
          topicDao: topicDao,
          networkDataSource: network,
          niaPreferencesDataSource: preference);
      synchronizer = TestSynchronizer(preference);
    });

    test('sync_pull_from_network', () async {
      await subject.syncWith(synchronizer);

      final newsFromDao =
          (await newsResourceDao.getPopulatedNewsResourceStream().first)
              .map((e) => NewsResource.fromEntity(e))
              .toList();

      final newsFromNetwork = (await network.getNewsResources())
          .map((e) => NewsResourceEntity.fromDto(e))
          .map((e) => NewsResource.fromEntityTest(e))
          .toList();

      expect(newsFromDao.map((e) => e.id),
          equals(newsFromNetwork.map((e) => e.id)));

      expect(
          (await synchronizer.getChangeListVersions()).newsResourceVersion,
          equals(
              (network.latestChangeListVersion(CollectionType.newsResources))));
    });
    test('sync_pull_from_network_and_deleted_item', () async {
      await subject.syncWith(synchronizer);

      final newsFromNetwork = (await network.getNewsResources())
          .map((e) => NewsResourceEntity.fromDto(e))
          .map((e) => NewsResource.fromEntityTest(e))
          .toList();

      final deleted = newsFromNetwork
          .sublist(0, newsFromNetwork.length ~/ 2)
          .map((e) => e.id)
          .toList();
      for (var id in deleted) {
        network.editCollection(CollectionType.newsResources, id, true);
      }

      await subject.syncWith(synchronizer);

      final newsFromDao =
          (await newsResourceDao.getPopulatedNewsResourceStream().first)
              .map((e) => NewsResource.fromEntity(e))
              .toList();

      expect(
          newsFromDao.map((e) => e.id).toList(),
          equals(newsFromNetwork
              .map((e) => e.id)
              .where((e) => !deleted.contains(e))));

      expect(
          (await synchronizer.getChangeListVersions()).newsResourceVersion,
          equals(
              (network.latestChangeListVersion(CollectionType.newsResources))));
    });

    test('sync_pull_from_network_add_case', () async {
      await synchronizer.updateChangeListVersions((version) =>
          ChangeListVersions(
              newsResourceVersion: 7, topicVersion: version.topicVersion));

      final changeList = network.changeListAfter(
        CollectionType.newsResources,
         7,
      );
      final changeListIds = changeList
          .map((e) => e.id)
          .toSet()
          .toList();

      final newsFromNetwork = (await network.getNewsResources())
          .map((e) => NewsResourceEntity.fromDto(e))
          .map((e) => NewsResource.fromEntityTest(e))
          .where((e) => changeListIds.contains(e.id.toString()))
          .toList();

      await subject.syncWith(synchronizer);

      final newsFromDao =
          (await newsResourceDao.getPopulatedNewsResourceStream().first)
              .map((e) => NewsResource.fromEntity(e))
              .toList();

      expect(newsFromDao.map((e) => e.id),
          equals(newsFromNetwork.map((e) => e.id)));

      expect(
          (await synchronizer.getChangeListVersions()).newsResourceVersion,
          equals(
              (network.latestChangeListVersion(CollectionType.newsResources))));
    });

    test('sync_pull_from_network_check_topic_entities', () async {
      await subject.syncWith(synchronizer);

      final topicsFromNetwork = (await network.getNewsResources())
          .map((e) => TopicEntity.fromNewsDto(e))
          .expand((list) => list)
          .toSet()
          .toList();

      final topicFromDao = (await topicDao.getTopicEntitiesStream().first);
      expect((topicsFromNetwork), equals(topicFromDao));
    });

    test('sync_pull_from_network_check_cross_ref', () async {
      await subject.syncWith(synchronizer);

      final expectCrossRef = (await network.getNewsResources())
          .map((e) => NewsResourceTopicCrossRef.fromDto(e))
          .expand((list) => list)
          .toSet()
          .toList();

      final crossRef = (newsResourceDao.crossRef);
      expect((expectCrossRef), equals(crossRef));
    });
  });
}
