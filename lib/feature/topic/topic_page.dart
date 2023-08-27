import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/repository/topics_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/usecase/get_followable_topic_by_id_use_case.dart';
import 'package:news/feature/topic/bloc/topic_bloc.dart';
import 'package:news/feature/topic/presentation/topic_screen.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key, required this.topicId});

  final String topicId;

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  late GetFollowableTopicByIdUseCase getFollowableTopicByIdUseCase;

  @override
  void initState() {
    super.initState();
    getFollowableTopicByIdUseCase =
        GetFollowableTopicByIdUseCase(topicsRepository, userDataRepository);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TopicBloc(
            topicId: widget.topicId,
            getFollowableTopicByIdUseCase: getFollowableTopicByIdUseCase,
            newsRepository: newsRepository,
            userDataRepository: userDataRepository),
        child: const SafeArea(child: TopicScreen()));
  }
}
