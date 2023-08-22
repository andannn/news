import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/core/usecase/get_followable_topics_use_case.dart';
import 'package:news/feature/for_you/bloc/for_you_bloc.dart';
import 'package:news/feature/for_you/presentation/for_you_screen.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  late GetFollowableTopicsUseCase _getFollowableTopicsUseCase;

  @override
  void initState() {
    super.initState();

    _getFollowableTopicsUseCase = createGetFollowableTopicsUseCase();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) {
          return ForYouBloc(
              userDataRepository: userDataRepository,
              getFollowableTopicsUseCase: _getFollowableTopicsUseCase,
              newsRepository: newsRepository);
        },
        child: const ForYouScreen());
  }
}
