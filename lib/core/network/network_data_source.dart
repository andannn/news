

import 'package:news/core/network/fake/fake_network_data_source.dart';

import 'model/network_change_list.dart';
import 'model/news_resource.dart';
import 'model/topic.dart';

NetworkDataSource networkDataSource = FakeNetworkDataSource();

abstract class NetworkDataSource {
  Future<List<TopicDto>> getTopics({List<String>? ids});

  Future<List<NewsResourceDto>> getNewsResources({List<String>? ids});

  Future<List<NetworkChangeList>> getTopicChangeList(int? after);

  Future<List<NetworkChangeList>> getNewsResourceChangeList({int? after});
}