import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/model/topic.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:news/core/usecase/get_followable_topic_by_id_use_case.dart';
import 'package:news/feature/topic/bloc/topic_bloc.dart';
import 'package:news/feature/topic/bloc/topic_ui_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fake_models/test_news_repository.dart';
import '../../fake_models/test_topic_repository.dart';

void main() {
  group('for_you_bloc_test', () {
    late TopicBloc topicBloc;

    late UserDataRepository userDataRepository;
    late TestTopicRepository topicsRepository;
    late TestNewsRepository newsRepository;
    late GetFollowableTopicByIdUseCase getFollowableTopicByIdUseCase;

    List<Topic> sampleTopics = [
      Topic(id: '0', name: '000', shortDescription: "test 0"),
      Topic(id: '1', name: '111', shortDescription: "test 1"),
      Topic(id: '2', name: '222', shortDescription: "test 2"),
    ];

    List<NewsResource> sampleNewsResources = [
      NewsResource(id: '0', content: 'AAAA', topics: [Topic(id: '0')]),
      NewsResource(
          id: '1', content: 'BBBB', topics: [Topic(id: '0'), Topic(id: '1')]),
      NewsResource(
          id: '2', content: 'CCCC', topics: [Topic(id: '1'), Topic(id: '2')]),
    ];

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      await niaUserDataSource.init();

      topicsRepository = TestTopicRepository();
      newsRepository = TestNewsRepository();
      userDataRepository = OfflineFirstUserDataRepository(niaUserDataSource);
      getFollowableTopicByIdUseCase =
          GetFollowableTopicByIdUseCase(topicsRepository, userDataRepository);

      topicBloc = TopicBloc(
          topicId: "0",
          getFollowableTopicByIdUseCase: getFollowableTopicByIdUseCase,
          userDataRepository: userDataRepository,
          newsRepository: newsRepository);
    });

    test('initial_state_test', () async {
      expect(topicBloc.state, equals(TopicUiState()));
      await topicBloc.close();
    });
    test('topic_bloc_test', () async {
      await userDataRepository.toggleFollowedTopicId(
          topicId: '1', followed: true);
      await Future.delayed(const Duration(seconds: 1));
      topicsRepository.sendTopics(sampleTopics);
      await Future.delayed(const Duration(seconds: 1));
      newsRepository.sendNewsResources(sampleNewsResources);
      await Future.delayed(const Duration(seconds: 1));

      expect(
          topicBloc.state.newsResourcesInTopic,
          equals([
            sampleNewsResources[0],
            sampleNewsResources[1],
          ]));
      expect(
          topicBloc.state.followedTopic,
          equals(FollowableTopic(sampleTopics[0], false)));
    });
  });
}
