import 'dart:async';

import 'package:news/core/database/dao/news_resource_dao.dart';
import 'package:news/core/database/model/topic_entity.dart';
import 'package:news/core/database/model/news_resource_entity.dart';
import 'package:news/core/database/model/news_resource_topic_corss_ref.dart';
import 'package:news/core/database/model/populated_news_resource.dart';

class TestNewsDao implements NewsResourceDao {
  StreamController<List<NewsResourceEntity>> controller = StreamController(sync: true);

  Stream<List<NewsResourceEntity>> get newsStream => controller.stream;
  List<NewsResourceEntity> currentList = [];
  List<NewsResourceTopicCrossRef> crossRef = [];

  TestNewsDao() {
    controller.add([]);
  }

  @override
  Future deleteNewsResources(List<String> ids) async {
    currentList =
        currentList.where((item) => !ids.contains(item.id.toString())).toList();
    controller.add(currentList);
  }

  @override
  Stream<List<String>> getNewsResourceIdsStream(
      {bool useFilterTopicIds = false,
      Set<String> filterTopicIds = const {},
      bool useFilterNewsIds = false,
      Set<String> filterNewsIds = const {}}) {
    return newsStream
        .map((newsList) => newsList
            .map((news) => getPopulatedNewsResource(news, crossRef))
            .toList())
        .map((newsList) {
      List<PopulatedNewsResource> result = newsList;
      if (useFilterTopicIds) {
        result = result.where((news) {
          return news.topics
              .any((element) => filterTopicIds.contains(element.id.toString()));
        }).toList();
      }
      if (useFilterNewsIds) {
        result = result.where((news) {
          return filterNewsIds.contains(news.entity.id.toString());
        }).toList();
      }
      return result.map((e) => e.entity.id.toString()).toList();
    });
  }

  @override
  Stream<List<PopulatedNewsResource>> getPopulatedNewsResourceStream(
      {bool useFilterTopicIds = false,
      Set<String> filterTopicIds = const {},
      bool useFilterNewsIds = false,
      Set<String> filterNewsIds = const {}}) {
    return Stream.value(currentList)
        .map((newsList) => newsList
            .map((news) => getPopulatedNewsResource(news, crossRef))
            .toList())
        .map((newsList) {
      List<PopulatedNewsResource> result = newsList;
      if (useFilterTopicIds) {
        result = result.where((news) {
          return news.topics
              .any((element) => filterTopicIds.contains(element.id.toString()));
        }).toList();
      }
      if (useFilterNewsIds) {
        result = result.where((news) {
          return filterNewsIds.contains(news.entity.id.toString());
        }).toList();
      }
      return result;
    });
  }

  @override
  Future<List> insertOrIgnoreNewsResources(
      List<NewsResourceEntity> entities) async {
    currentList = (currentList + entities).toSet().toList();
    controller.add(currentList);
    return entities.map((e) => e.id).toList();
  }

  @override
  Future insertOrIgnoreTopicCrossRefEntities(
      List<NewsResourceTopicCrossRef> newsResourceTopicCrossReferences) async {
    crossRef = (crossRef + newsResourceTopicCrossReferences).toSet().toList();
  }

  @override
  Future<List> upsertNewsResources(List<NewsResourceEntity> entities) async {
    currentList = (currentList + entities).toSet().toList();
    controller.add(currentList);
    return entities.map((e) => e.id).toList();
  }

  PopulatedNewsResource getPopulatedNewsResource(
      NewsResourceEntity news, List<NewsResourceTopicCrossRef> crossRef) {
    return PopulatedNewsResource(
        entity: news,
        topics: crossRef
            .where((e) => e.newsResourceId == news.id.toString())
            .map((crossRef) => TopicEntity(id: int.parse(crossRef.topicId)))
            .toList());
  }
}
