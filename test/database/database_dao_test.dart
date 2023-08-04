import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/nia_database_impl.dart';
import 'package:news/core/network/model/topic.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('topic_dao_test', () {
    late NiaDatabase database;
    late TopicDao topicDao;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      database = NiaDatabase();
      await database.initDatabase(
          dbName: 'test_nia_data_base.db', isTest: true);

      topicDao = database.getTopicDao();
    });

    test('get_topics', () async {
      final res = await topicDao.insertOrIgnoreTopics([
        const TopicModel(
            id: "1",
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: "")
      ]);
      expect(res, equals([1]));
    });
  });
}
