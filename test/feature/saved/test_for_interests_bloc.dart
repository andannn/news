import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/model/topic.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:news/feature/interests/bloc/interests_bloc.dart';
import 'package:news/feature/interests/bloc/interests_ui_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fake_models/test_news_repository.dart';
import '../../fake_models/test_topic_repository.dart';

void main() {
  group('for_you_bloc_test', () {
    late InterestBloc interestBloc;

    late UserDataRepository userDataRepository;
    late TestTopicRepository topicsRepository;
    late TestNewsRepository newsRepository;
    late GetFollowableTopicsUseCase getFollowableTopicsUseCase;

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
      getFollowableTopicsUseCase =
          GetFollowableTopicsUseCase(topicsRepository, userDataRepository);

      interestBloc = InterestBloc(
          getFollowableTopicsUseCase: getFollowableTopicsUseCase,
          userDataRepository: userDataRepository);
    });

    test('initial_state_test', () async {
      expect(interestBloc.state, equals(InterestsUiState()));
      await interestBloc.close();
    });
    test('onboarding_state_test', () async {
      await userDataRepository.toggleFollowedTopicId(
          topicId: '1', followed: true);
      await Future.delayed(const Duration(seconds: 1));
      topicsRepository.sendTopics(sampleTopics);
      await Future.delayed(const Duration(seconds: 1));

      expect(
          interestBloc.state.topics,
          equals([
            FollowableTopic(sampleTopics[0], false),
            FollowableTopic(sampleTopics[1], true),
            FollowableTopic(sampleTopics[2], false),
          ]));
    });
  });
}
