import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('shared_preference_test', () {
    late NiaPreferencesDataSource dataSource;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      dataSource = NiaPreferencesDataSource();
    });

    test('set_followed_topics', () async {
      await dataSource.setFollowedTopicIds({'1', '3'});
      expect(await dataSource.getFollowedTopicIds(), equals({'1', '3'}));
    });
  });
}
