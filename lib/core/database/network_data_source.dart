

import '../network/model/news_resource.dart';
import '../network/model/topic.dart';

abstract class NetworkDataSource {
  Future<List<TopicModel>> getTopics({List<String>? ids});

  Future<List<NewsResource>> getNewsResources({List<String>? ids});
}