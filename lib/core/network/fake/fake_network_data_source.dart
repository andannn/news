import 'package:news/core/network/fake/news_data.dart';
import 'package:news/core/network/fake/topics_data.dart';
import 'package:news/core/network/model/network_change_list.dart';
import 'package:news/core/network/network_data_source.dart';

import '../model/news_resource.dart';
import '../model/topic.dart';

class FakeNetworkDataSource implements NetworkDataSource {

  @override
  Future<List<NewsResourceDto>> getNewsResources({List<String>? ids}) async {
    if (ids == null) {
      return newsFakeData.map((e) => NewsResourceDto.fromJson(e)).toList();
    }

    return newsFakeData
        .map((e) => NewsResourceDto.fromJson(e))
        .where((newsDto) => ids.contains(newsDto.id) == true)
        .toList();
  }

  @override
  Future<List<TopicDto>> getTopics({List<String>? ids}) async {
    if (ids == null) {
      return newsFakeData.map((e) => TopicDto.fromJson(e)).toList();
    }

    return topicsFakeData.map((e) => TopicDto.fromJson(e))
        .where((dto) => ids.contains(dto.id) == true)
        .toList();
  }

  @override
  Future<List<NetworkChangeList>> getNewsResourceChangeList(
      {int? after}) async {
    final topics = await getNewsResources();
    return topics
        .map((e) => NetworkChangeList(
            id: e.id, changeListVersion: topics.indexOf(e), isDelete: false))
        .toList();
  }

  @override
  Future<List<NetworkChangeList>> getTopicChangeList(int? after) async {
    final news = await getTopics();
    return news
        .map((e) => NetworkChangeList(
            id: e.id, changeListVersion: news.indexOf(e), isDelete: false))
        .toList();
  }
}
