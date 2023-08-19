import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/database/nia_database.dart';
import 'package:news/core/network/network_data_source.dart';
import 'package:news/core/shared_preference/user_data.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:news/feature/for_you/bloc/for_you_bloc.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  late UserDataRepository _userDataRepository;
  late TopicsRepository _topicsRepository;
  late GetFollowableTopicsUseCase _getFollowableTopicsUseCase;

  @override
  void initState() {
    super.initState();

    _userDataRepository = OfflineFirstUserDataRepository(niaUserDataSource);
    _topicsRepository = OfflineFirstTopicsRepository(
        topicDao: niaDatabase.getTopicDao(),
        networkDataSource: networkDataSource);
    _getFollowableTopicsUseCase =
        GetFollowableTopicsUseCase(_topicsRepository, _userDataRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) {
          return ForYouBloc(
              userDataRepository: _userDataRepository,
              getFollowableTopicsUseCase: _getFollowableTopicsUseCase);
        },
        child: Container(color: Colors.red));
  }
}
