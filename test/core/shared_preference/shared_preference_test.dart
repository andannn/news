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
    test('get_followed_topics_stream', () async {
      await dataSource.setFollowedTopicIds({'1', '3'});
      final res = await dataSource.getFollowedTopicIdsStream().first;
      expect(res, equals({'1', '3'}));
    });
    test('get_should_hide_onboarding_stream', () async {
      await dataSource.setShouldHideOnboarding(true);
      final res = await dataSource.getShouldHideOnBoardingStream().first;
      expect(res, equals(true));
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
    test('update_saved_news_resources', () async {
      await dataSource.updateNewsResourceBookmark(newsId: '1', saved: true);
      await dataSource.updateNewsResourceBookmark(newsId: '2', saved: true);
      final res = await dataSource.getSavedBookmarkedNewsResourcesStream().first;
      expect(res, equals(['1', '2']));
    });
  });
}
