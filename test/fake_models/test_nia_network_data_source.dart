import 'package:news/core/network/fake/fake_network_data_source.dart';
import 'package:news/core/network/model/network_change_list.dart';
import 'package:news/core/network/model/news_resource.dart';
import 'package:news/core/network/model/topic.dart';
import 'package:news/core/network/network_data_source.dart';

enum CollectionType {
  topics,
  newsResources,
}

class TestNiaNetworkDataSource extends NetworkDataSource {
  NetworkDataSource source = FakeNetworkDataSource();

  List<TopicDto> _allTopics = [];
  List<NewsResourceDto> _allNewsResources = [];

  Map<CollectionType, List<NetworkChangeList>> _changeLists = {};

  init() async {
    _allTopics = await source.getTopics();
    _allNewsResources = await source.getNewsResources();

    _changeLists = {
      CollectionType.topics:
          mapToChangeList(_allTopics, idGetter: (topicDto) => topicDto.id),
      CollectionType.newsResources: mapToChangeList(_allNewsResources,
          idGetter: (topicDto) => topicDto.id)
    };
  }

  @override
  Future<List<NetworkChangeList>> getNewsResourceChangeList({int? after}) async {
    final list= _changeLists[CollectionType.newsResources]!;
    return afterVersion(list, after);
  }

  @override
  Future<List<NewsResourceDto>> getNewsResources({List<String>? ids}) =>
      source.getNewsResources(ids: ids);

  @override
  Future<List<NetworkChangeList>> getTopicChangeList(int? after) async {
    final list= _changeLists[CollectionType.topics]!;
    return afterVersion(list, after);
  }

  @override
  Future<List<TopicDto>> getTopics({List<String>? ids}) =>
      source.getTopics(ids: ids);

  int latestChangeListVersion(CollectionType type) {
    final list = _changeLists[type]!;
    return list.last.changeListVersion;
  }

  List<NetworkChangeList> changeListAfter(CollectionType type, int version) {
    final list= _changeLists[type]!;
    return afterVersion(list, version);
  }

  void editCollection(CollectionType type, String id, bool isDeleted) {
    final changeList = _changeLists[type]!;
    final latestVersion = changeList.last.changeListVersion;
    final change = NetworkChangeList(
      id : id,
      isDelete : isDeleted,
      changeListVersion : latestVersion + 1,
    );
    _changeLists[type] = changeList.where((e) => e.id != id).toList() + [change];
  }

  static List<NetworkChangeList> mapToChangeList<T>(List<T> list,
      {required String Function(T topicDto) idGetter}) {
    return list
        .map((e) => NetworkChangeList(
            id: idGetter(e),
            changeListVersion: list.indexOf(e) + 1,
            isDelete: false))
        .toList();
  }

  static List<NetworkChangeList> afterVersion(List<NetworkChangeList> list,
      int? version) {
    switch (version) {
      case null :
        return list;
      default :
        return list.where((e) => e.changeListVersion > version).toList();
    }
  }
}
