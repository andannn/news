import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/sync_utils.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/model/topic_entity.dart';
import 'package:news/core/network/fake/fake_network_data_source.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_models/test_nia_network_data_source.dart';
import 'fake_models/test_topic_dao.dart';
import 'test_synchronizer.dart';

void main() {
  group('shared_preference_test', () {
    late NiaPreferencesDataSource preference;
    late OfflineFirstTopicsRepository subject;
    late TopicDao topicDao;
    late Synchronizer synchronizer;
    late TestNiaNetworkDataSource network;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      preference = NiaPreferencesDataSource();

      network = TestNiaNetworkDataSource();
      await network.init();

      topicDao = TestTopicDao();
      subject = OfflineFirstTopicsRepository(
          topicDao: topicDao, networkDataSource: network);
      synchronizer = TestSynchronizer(preference);
    });

    test('sync_pull_from_network', () async {
      await subject.syncWith(synchronizer);

      List<TopicEntity> networkTopics = (await network.getTopics())
          .map((e) => TopicEntity.fromTopicDto(e))
          .toList();

      List<TopicEntity> dbTopics = await topicDao.getTopicEntitiesStream().first;

      expect(networkTopics, equals(dbTopics));
    });
  });
}
