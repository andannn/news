import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/network/fake/fake_network_data_source.dart';
import 'package:news/core/network/model/news_resource.dart';
import 'package:news/core/network/model/news_resource_type.dart';
import 'package:news/core/network/model/topic.dart';

void main() {
  group('fake_network_data_source_test', () {
    late FakeNetworkDataSource dataSource;

    setUp(() async {
      dataSource = FakeNetworkDataSource();
    });

    test('get_topics', () async {
      final result = await dataSource.getTopics();
      final expectRes = TopicDto(
          id: "1",
          name: "Headlines",
          shortDescription: "News you'll definitely be interested in",
          longDescription:
              "The latest events and announcements from the world of Android development.",
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/now-in-android.appspot.com/o/img%2Fic_topic_Headlines.svg?alt=media&token=506faab0-617a-4668-9e63-4a2fb996603f",
          url: "");

      expect(result.first.toJson(), equals(expectRes.toJson()));
    });

    test('get_news', () async {
      final result = await dataSource.getNewsResources();
      final expectRes = NewsResourceDto(
        id: "125",
        title: "Android Basics with Compose",
        content:
            "We released the first two units of Android Basics with Compose, our first free course that teaches Android Development with Jetpack Compose to anyone; you do not need any prior programming experience other than basic computer literacy to get started. ",
        url:
            "https://android-developers.googleblog.com/2022/05/new-android-basics-with-compose-course.html",
        headerImageUrl:
            "https://developer.android.com/images/hero-assets/android-basics-compose.svg",
        publishDate: DateTime.utc(
          2022,
          5,
          4,
          23,
        ),
        type: NewsResourceType.codelab,
        topics: const ["2", "3", "10"],
      );

      expect(result.firstWhere((element) => element.id == '125').toJson(),
          equals(expectRes.toJson()));
    });
  });
}
