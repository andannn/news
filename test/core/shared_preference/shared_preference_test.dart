import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/data/sync_utils.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('shared_preference_test', () {
    late NiaPreferencesDataSource dataSource;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      dataSource = NiaPreferencesDataSource();
      await dataSource.init();
    });

    test('set_followed_topics', () async {
      await dataSource.setFollowedTopicIds({'1', '3'});
      expect(await dataSource.getFollowedTopicIds(), equals({'1', '3'}));
    });
    test('set_toggle_topics', () async {
      await dataSource.setFollowedTopicIds({'1', '3'});
      await dataSource.toggleFollowedTopicId(topicId: '1', followed: false);
      expect(await dataSource.getFollowedTopicIds(), equals({'3'}));
    });
    test('update_change_list_version', () async {
      await dataSource.updateChangeListVersion(update: (oldVersion) {
        return ChangeListVersions(
          topicVersion: oldVersion.topicVersion,
          newsResourceVersion: 1
        );
      });
      final newVersion = await dataSource.getChangeListVersions();
      expect(newVersion.topicVersion, equals(-1));
      expect(newVersion.newsResourceVersion, equals(1));
    });
  });
}
