import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app/local/nia_localizations_delegate.dart';
import 'package:news/app/navigation/nia_router.dart';
import 'package:news/app/navigation/top_level_navigation.dart';
import 'package:news/app/ui/theme_data.dart';
import 'package:news/core/data/repository/news_resource_repository.dart';
import 'package:news/core/data/repository/user_data_repository.dart';
import 'package:news/feature/book_marked/bloc/book_marked_bloc.dart';
import 'package:news/feature/interests/bloc/interests_bloc.dart';

import '../../core/usecase/get_followable_topics_use_case.dart';
import '../../feature/for_you/bloc/for_you_bloc.dart';

class NiaApp extends StatefulWidget {
  const NiaApp({super.key});

  @override
  State<StatefulWidget> createState() => NiaAppState();
}

class NiaAppState extends State<NiaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData,
      localizationsDelegates: [NiaLocalizationsDelegate()],
      home: const NiaAppScaffold(),
    );
  }
}

class NiaAppScaffold extends StatefulWidget {
  const NiaAppScaffold({super.key});

  @override
  State<NiaAppScaffold> createState() => _NiaAppScaffoldState();
}

class _NiaAppScaffoldState extends State<NiaAppScaffold> {
  final niaRouterDelegate = NiaRouterDelegate();

  late VoidCallback _navigationListener;

  var currentNavigation = TopLevelNavigation.forYou;
  late GetFollowableTopicsUseCase _getFollowableTopicsUseCase;

  @override
  void initState() {
    super.initState();
    _getFollowableTopicsUseCase = createGetFollowableTopicsUseCase();

    _navigationListener = () {
      setState(() {
        currentNavigation = niaRouterDelegate.currentTopLevelNavigation;
      });
    };
    niaRouterDelegate.addListener(_navigationListener);
  }

  @override
  void dispose() {
    super.dispose();
    niaRouterDelegate.removeListener(_navigationListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _niaAppBar(navigation: currentNavigation),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ForYouBloc(
                  userDataRepository: userDataRepository,
                  getFollowableTopicsUseCase: _getFollowableTopicsUseCase,
                  newsRepository: newsRepository)),
          BlocProvider(
              create: (context) => BookMarkedBloc(
                  userDataRepository: userDataRepository,
                  newsRepository: newsRepository)),
          BlocProvider(
              create: (context) => InterestBloc(
                  userDataRepository: userDataRepository,
                  getFollowableTopicsUseCase: _getFollowableTopicsUseCase))
        ],
        child: Router(
            routerDelegate: niaRouterDelegate,
            backButtonDispatcher: RootBackButtonDispatcher()),
      ),
      bottomNavigationBar: _niaNavigationBar(
          selected: currentNavigation,
          onNavigateToDestination: (navigation) async {
            niaRouterDelegate.navigateToTopLevelPage(navigation);
          }),
    );
  }

  PreferredSizeWidget _niaAppBar({
    required TopLevelNavigation navigation,
    VoidCallback? onSettingClick,
    VoidCallback? onSearchClick,
  }) =>
      AppBar(
        leading: IconButton(
            onPressed: onSearchClick, icon: const Icon(Icons.search)),
        title: Align(
            alignment: Alignment.center, child: Text(navigation.titleTextId)),
        actions: [
          IconButton(
              onPressed: onSettingClick, icon: const Icon(Icons.settings))
        ],
      );

  Widget? _niaNavigationBar(
      {required TopLevelNavigation selected,
      required Function(TopLevelNavigation) onNavigateToDestination}) {
    final currentIndex = TopLevelNavigation.values.indexOf(selected);
    return BottomNavigationBar(
        onTap: (index) {
          if (currentIndex != index) {
            onNavigateToDestination(TopLevelNavigation.values[index]);
          }
        },
        currentIndex: currentIndex,
        items: TopLevelNavigation.values
            .map((navigation) => navigation.toBottomNavigationBarItem(
                isSelected: navigation == selected))
            .toList());
  }
}
