
import 'package:news/core/network/fake/news_data.dart';
import 'package:news/core/network/fake/topics_data.dart';
import 'package:news/core/network/network_data_source.dart';

import '../model/news_resource.dart';
import '../model/topic.dart';

class FakeNetworkDataSource implements NetworkDataSource {
  @override
  Future<List<NewsResourceDto>> getNewsResources({List<String>? ids}) {
    return Future.delayed(Duration.zero).then((value) =>
        newsFakeData.map((e) => NewsResourceDto.fromJson(e)).toList()
    );
  }

  @override
  Future<List<TopicDto>> getTopics({List<String>? ids}) {
    return Future.delayed(Duration.zero).then((value) =>
        topicsFakeData.map((e) => TopicDto.fromJson(e)).toList()
    );
  }
}