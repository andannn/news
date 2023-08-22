import 'dart:async';

import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/model/topic.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/sync_utils.dart';

class TestNewsRepository extends NewsRepository {
  StreamController<List<NewsResource>> controller =
      StreamController.broadcast();

  @override
  Future<bool> syncWith(Synchronizer synchronizer) {
    return Future.value(true);
  }

  @override
  Stream<List<NewsResource>> getNewsResources(
      {Set<String> filterTopicIds = const {},
      Set<String> filterNewsIds = const {}}) {
    return controller.stream.map((resources) {
      var result = resources;

      if (filterTopicIds.isNotEmpty) {
        result = result
            .where((element) => element.topics
                .any((topic) => filterTopicIds.contains(topic.id)))
            .toList();
      }

      if (filterNewsIds.isNotEmpty) {
        result = result
            .where((element) => filterNewsIds.contains(element.id))
            .toList();
      }
      return result;
    });
  }

  void sendNewsResources(List<NewsResource> newsResources) {
    controller.add(newsResources);
  }
}
