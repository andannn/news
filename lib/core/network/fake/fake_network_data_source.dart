
import 'package:news/core/network/fake/news_data.dart';
import 'package:news/core/network/fake/topics_data.dart';
import 'package:news/core/network/network_data_source.dart';

import '../../model/news_resource.dart';
import '../../model/topic.dart';

class FakeNetworkDataSource implements NetworkDataSource {
  @override
  Future<List<NewsResource>> getNewsResources({List<String>? ids}) {
    return Future.delayed(Duration.zero).then((value) =>
        newsFakeData.map((e) => NewsResource.fromJson(e)).toList()
    );
  }

  @override
  Future<List<TopicModel>> getTopics({List<String>? ids}) {
    return Future.delayed(Duration.zero).then((value) =>
        topicsFakeData.map((e) => TopicModel.fromJson(e)).toList()
    );
  }
}