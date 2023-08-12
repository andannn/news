import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/sync_utils.dart';
import 'package:news/core/database/dao/news_resource_dao.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/model/news_resource_entity.dart';
import 'package:news/core/network/fake/fake_network_data_source.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_models/test_news_dao.dart';
import 'fake_models/test_topic_dao.dart';
import 'test_synchronizer.dart';

void main() {
  group('shared_preference_test', () {
    late NiaPreferencesDataSource preference;
    late OfflineFirstNewsRepository subject;
    late TestNewsDao newsResourceDao;
    late TestTopicDao topicDao;
    late FakeNetworkDataSource network;
    late Synchronizer synchronizer;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      preference = NiaPreferencesDataSource();

      network = FakeNetworkDataSource();
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
      subject.syncWith(synchronizer);

      final newsFromDao =
          (await newsResourceDao.getPopulatedNewsResourceStream().first)
              .map((e) => NewsResource.fromEntity(e))
              .toList();

      (await newsResourceDao.getPopulatedNewsResourceStream().first)
          .map((e) => NewsResource.fromEntity(e))
          .toList();

      print(newsFromDao);

      final newsFromNetwork = (await network.getNewsResources())
          .map((e) => NewsResourceEntity.fromDto(e))
          .map((e) => NewsResource.fromEntityTest(e))
          .toList();
    });
  });
}
