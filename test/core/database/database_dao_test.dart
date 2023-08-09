import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/database/dao/news_resource_dao.dart';
import 'package:news/core/database/dao/topic_dao.dart';
import 'package:news/core/database/model/news_resource_entity.dart';
import 'package:news/core/database/model/news_resource_topic_corss_ref.dart';
import 'package:news/core/database/model/topic_entity.dart';
import 'package:news/core/database/nia_database.dart';
import 'package:news/core/network/model/news_resource_type.dart';
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

    test('insert_or_ignore_topics', () async {
      final res = await topicDao.insertOrIgnoreTopics([
        const TopicEntity(
            id: 1,
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: ""),
        const TopicEntity(
            id: 1,
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: "")
      ]);
      expect(res, equals([1, null]));
    });
    test('upsert_topics', () async {
      await topicDao.insertOrIgnoreTopics([
        const TopicEntity(
            id: 1,
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: "")
      ]);

      await topicDao.upsertTopics([
        const TopicEntity(
            id: 1,
            name: "Headlines updated",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: "")
      ]);
    });
    test('get_topics_by_id', () async {
      await topicDao.insertOrIgnoreTopics([
        const TopicEntity(
            id: 1,
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: "")
      ]);
      final topic = await topicDao.getTopicEntity('1');
      expect(topic!.name, equals('Headlines'));
    });
    test('get_all_topics_by_id', () async {
      await topicDao.insertOrIgnoreTopics([
        const TopicEntity(
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: ""),
        const TopicEntity(
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: "")
      ]);
      final topics = await topicDao.getTopicEntities();
      expect(topics.length, equals(2));
    });
    test('delete_topics_by_ids', () async {
      await topicDao.insertOrIgnoreTopics([
        const TopicEntity(
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: ""),
        const TopicEntity(
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: "")
      ]);
      final res = await topicDao.deleteTopics(['1', '3', '5']);
      expect(res, [1]);
    });
    test('get_topics_by_ids', () async {
      await topicDao.insertOrIgnoreTopics([
        const TopicEntity(
            id: 1,
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: ""),
        const TopicEntity(
            id: 2,
            name: "Headlines",
            shortDescription: "News you'll definitely be interested in",
            longDescription:
                "The latest events and announcements from the world of Android development.",
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
            url: "")
      ]);
      final res = await topicDao.getTopicEntitiesById({'1', '2', '5'});
      expect(res[2], null);
    });
  });

  group('news_resource_dao_test', () {
    late NiaDatabase database;
    late NewsResourceDao newsResourceDao;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      database = NiaDatabase();
      await database.initDatabase(
          dbName: 'test_nia_data_base.db', isTest: true);

      newsResourceDao = database.getNewsResourceDao();
    });

    test('insert_or_ignore_news_resource', () async {
      final res = await newsResourceDao.insertOrIgnoreNewsResources([
        NewsResourceEntity(
          id: 145,
          title: "Migrating Architecture Blueprints to Jetpack Compose",
          content:
              "Manuel wrote about how and why we’ve Migrated our Architecture Blueprints to Jetpack Compose, and some issues we faced in doing so.",
          url:
              "https://medium.com/androiddevelopers/migrating-architecture-blueprints-to-jetpack-compose-8ffa6615ede3",
          headerImageUrl:
              "https://miro.medium.com/max/1400/1*J2NKRQ4qedvMVWoxL_4ZLA.jpeg",
          publishDate: DateTime.utc(
            2022,
            5,
            4,
            23,
          ),
          type: NewsResourceType.apiChange,
        )
      ]);
      expect(res, equals([145]));
    });
    test('insert_or_ignore_news_resource', () async {
      await newsResourceDao.insertOrIgnoreNewsResources([
        NewsResourceEntity(
          id: 145,
          title: "Migrating Architecture Blueprints to Jetpack Compose",
          content:
              "Manuel wrote about how and why we’ve Migrated our Architecture Blueprints to Jetpack Compose, and some issues we faced in doing so.",
          url:
              "https://medium.com/androiddevelopers/migrating-architecture-blueprints-to-jetpack-compose-8ffa6615ede3",
          headerImageUrl:
              "https://miro.medium.com/max/1400/1*J2NKRQ4qedvMVWoxL_4ZLA.jpeg",
          publishDate: DateTime.utc(
            2022,
            5,
            4,
            23,
          ),
          type: NewsResourceType.apiChange,
        )
      ]);
      final res = await newsResourceDao.deleteNewsResources(['145']);
      expect(res, equals([1]));
    });
    test('insert_or_ignore_cross_ref', () async {
      await newsResourceDao.insertOrIgnoreTopicCrossRefEntities([
        const NewsResourceTopicCrossRef(newsResourceId: '1', topicId: '3'),
        const NewsResourceTopicCrossRef(newsResourceId: '2', topicId: '3'),
        const NewsResourceTopicCrossRef(newsResourceId: '4', topicId: '3'),
      ]);
    });
    test('get_news_resource_id_by_condition_1', () async {
      await _initialInsert(database);
      final res = await newsResourceDao.getNewsResourceIds(
        useFilterNewsIds: true,
        filterNewsIds: {'137', '145'}
      );
      expect(res, equals(['137', '145']));
    });
    test('get_news_resource_id_by_condition_2', () async {
      await _initialInsert(database);
      final res = await newsResourceDao.getNewsResourceIds(
        useFilterTopicIds: true,
        filterTopicIds: {'1'}
      );
      expect(res, equals(['137', '145']));
    });
    test('get_news_resource_id_by_condition_2', () async {
      await _initialInsert(database);
      final res = await newsResourceDao.getNewsResourceIds(
          useFilterNewsIds: true,
          filterNewsIds: {'137'},
          useFilterTopicIds: true,
          filterTopicIds: {'1'}
      );
      expect(res, equals(['137']));
    });
    test('get_populated_news_resource_id_condition_1', () async {
      await _initialInsert(database);
      final res = await newsResourceDao.getPopulatedNewsResource(
          useFilterNewsIds: true,
          filterNewsIds: {'137'},
          useFilterTopicIds: true,
          filterTopicIds: {'1'}
      );
      expect(res.map((e) => e.entity.id).toList(), equals([137]));
    });
    test('get_populated_news_resource_id_condition_2', () async {
      await _initialInsert(database);
      final res = await newsResourceDao.getPopulatedNewsResource(
          useFilterNewsIds: true,
          filterNewsIds: {'145'},
      );
      expect(res.map((e) => e.entity.id).toList(), equals([137]));
    });
  });
}

_initialInsert(NiaDatabase dataBase) async {
  await dataBase.getTopicDao().insertOrIgnoreTopics([
    const TopicEntity(
        id: 1,
        name: "Headlines",
        shortDescription: "News you'll definitely be interested in",
        longDescription:
        "The latest events and announcements from the world of Android development.",
        imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
        url: ""),
    const TopicEntity(
        id: 2,
        name: "Headlines",
        shortDescription: "News you'll definitely be interested in",
        longDescription:
        "The latest events and announcements from the world of Android development.",
        imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
        url: "")
  ]);
  await dataBase.getNewsResourceDao().insertOrIgnoreNewsResources([
    NewsResourceEntity(
      id: 145,
      title: "Migrating Architecture Blueprints to Jetpack Compose",
      content:
      "Manuel wrote about how and why we’ve Migrated our Architecture Blueprints to Jetpack Compose, and some issues we faced in doing so.",
      url:
      "https://medium.com/androiddevelopers/migrating-architecture-blueprints-to-jetpack-compose-8ffa6615ede3",
      headerImageUrl:
      "https://miro.medium.com/max/1400/1*J2NKRQ4qedvMVWoxL_4ZLA.jpeg",
      publishDate: DateTime.utc(
        2022,
        5,
        4,
        23,
      ),
      type: NewsResourceType.apiChange,
    ),
    NewsResourceEntity(
      id: 137,
      title: "Migrating Architecture Blueprints to Jetpack Compose",
      content:
      "Manuel wrote about how and why we’ve Migrated our Architecture Blueprints to Jetpack Compose, and some issues we faced in doing so.",
      url:
      "https://medium.com/androiddevelopers/migrating-architecture-blueprints-to-jetpack-compose-8ffa6615ede3",
      headerImageUrl:
      "https://miro.medium.com/max/1400/1*J2NKRQ4qedvMVWoxL_4ZLA.jpeg",
      publishDate: DateTime.utc(2022, 5, 4, 23,),
      type: NewsResourceType.apiChange,
    )
  ]);
  await dataBase.getNewsResourceDao().insertOrIgnoreTopicCrossRefEntities([
    const NewsResourceTopicCrossRef(newsResourceId: '137', topicId: '1'),
    const NewsResourceTopicCrossRef(newsResourceId: '145', topicId: '1'),
    const NewsResourceTopicCrossRef(newsResourceId: '145', topicId: '2'),
  ]);
}
