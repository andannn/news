import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/topic.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:news/feature/for_you/bloc/for_you_bloc.dart';
import 'package:news/feature/for_you/bloc/for_you_event.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';
import 'package:news/feature/for_you/bloc/news_feed_state.dart';
import 'package:news/feature/for_you/bloc/onboarding_ui_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fake_models/test_topic_repository.dart';

void main() {
  group('for_you_bloc_test', () {
    late ForYouBloc forYouBloc;

    late UserDataRepository userDataRepository;
    late GetFollowableTopicsUseCase getFollowableTopicsUseCase;
    late TestTopicRepository topicsRepository;

    List<Topic> sampleTopics = [
      Topic(id: '0', name: '000', shortDescription: "test 0"),
      Topic(id: '1', name: '111', shortDescription: "test 1"),
      Topic(id: '2', name: '222', shortDescription: "test 2"),
    ];

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      await niaUserDataSource.init();

      topicsRepository = TestTopicRepository();
      userDataRepository = OfflineFirstUserDataRepository(niaUserDataSource);
      getFollowableTopicsUseCase =
          GetFollowableTopicsUseCase(topicsRepository, userDataRepository);

      forYouBloc = ForYouBloc(
          userDataRepository: userDataRepository,
          getFollowableTopicsUseCase: getFollowableTopicsUseCase);
    });

    test('initial_state_test', () async {
      expect(forYouBloc.state, equals(ForYouUiState(OnboardingLoading(), NewsFeedLoading())));
    });
    test('onboarding_state_test', () async {
      topicsRepository.sendTopics(sampleTopics);
      await userDataRepository.setFollowedTopicIds({'1'});

      await Future.delayed(const Duration(seconds: 1));

      expect(
          forYouBloc.state,
          equals(ForYouUiState(OnboardingShown([
            FollowableTopic(sampleTopics[0], false),
            FollowableTopic(sampleTopics[1], true),
            FollowableTopic(sampleTopics[2], false),
          ]), NewsFeedLoading())));
    });
    test('for_you_bloc_toggle_followed_id_test', () async {
      topicsRepository.sendTopics(sampleTopics);
      await userDataRepository.setFollowedTopicIds({'1'});

      forYouBloc.add(const OnUpdateTopicSelection('0', true));

      await Future.delayed(const Duration(seconds: 1));

      expect(
          forYouBloc.state,
          equals(ForYouUiState(OnboardingShown([
            FollowableTopic(sampleTopics[0], true),
            FollowableTopic(sampleTopics[1], true),
            FollowableTopic(sampleTopics[2], false),
          ]), NewsFeedLoading())));
    });
  });
}
