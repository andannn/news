import 'package:flutter_test/flutter_test.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/topic.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:news/core/usecase/get_followable_topic_by_id_use_case.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fake_models/test_topic_repository.dart';

void main() {
  group('use_case_test', () {
    late GetFollowableTopicsUseCase getFollowableTopicsUseCase;
    late GetFollowableTopicByIdUseCase getFollowableTopicByIdUseCase;
    late TestTopicRepository topicsRepository;
    late UserDataRepository userDataRepository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      await niaUserDataSource.init();

      topicsRepository = TestTopicRepository();
      userDataRepository = OfflineFirstUserDataRepository(niaUserDataSource);
      getFollowableTopicsUseCase =
          GetFollowableTopicsUseCase(topicsRepository, userDataRepository);
      getFollowableTopicByIdUseCase =
          GetFollowableTopicByIdUseCase(topicsRepository, userDataRepository);
    });

    List<Topic> topics = [
      Topic(id: '1', name: 'a'),
      Topic(id: '2', name: 'b'),
      Topic(id: '3', name: 'c'),
    ];

    test('get_followable_topics_use_case', () async {
      final followableTopicStream = getFollowableTopicsUseCase.invoke().asBroadcastStream();
      followableTopicStream.listen((event) {});

      userDataRepository.setFollowedTopicIds({'1'});
      await Future.delayed(Duration(seconds: 1));
      // send some data
      topicsRepository.sendTopics(topics);
      final result = await followableTopicStream.first;
      expect(
          result,
          equals([
            FollowableTopic(topics[0], true),
            FollowableTopic(topics[1], false),
            FollowableTopic(topics[2], false),
          ]));
    });
    test('get_followable_topic_by_id_use_case', () async {
      final followableTopicStream =
          getFollowableTopicByIdUseCase.invoke("1").asBroadcastStream();
      followableTopicStream.listen((event) {});
      await userDataRepository.setFollowedTopicIds({'1'});
      await Future.delayed(Duration(seconds: 1));
      // send some data
      topicsRepository.sendTopics(topics);
      final result = await followableTopicStream.first;
      expect(
          result,
          equals(
            FollowableTopic(topics[0], true),
          ));
    });
  });
}
