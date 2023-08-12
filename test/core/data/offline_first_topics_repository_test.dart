import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/sync_utils.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/network/fake/fake_network_data_source.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fake_models/test_topic_dao.dart';
import 'test_synchronizer.dart';

void main() {
  group('shared_preference_test', () {
    late NiaPreferencesDataSource preference;
    late OfflineFirstTopicsRepository subject;
    late TopicDao topicDao;
    late FakeNetworkDataSource network;
    late Synchronizer synchronizer;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      preference = NiaPreferencesDataSource();

      network = FakeNetworkDataSource();
      topicDao = TestTopicDao();
      subject = OfflineFirstTopicsRepository(topicDao: topicDao);
      synchronizer = TestSynchronizer(preference);
    });

    test('sync_pull_from_network', () async {
    });
  });
}
