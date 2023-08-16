import 'package:flutter/material.dart';
import 'package:news/app/navigation/nia_navigator.dart';
import 'package:news/app/navigation/top_level_navigation.dart';
import 'package:news/feature/book_marked/navigation/book_marked_navigation.dart';

import '../../feature/for_you/navigation/for_you_navigation.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
        useMaterial3: true,
      ),
      home: NiaAppScaffold(),
    );
  }
}

class NiaAppScaffold extends StatelessWidget {
  NiaAppScaffold({super.key});

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _niaAppBar(),
      body: NiaRouter(navigatorKey: _navigatorKey),
      bottomNavigationBar: _niaNavigationBar(
          selected: TopLevelNavigation.forYou,
          onNavigateToDestination: (navigation) async {
            final navigator = _navigatorKey.currentState!;
            await _navigateToDestination(navigator, navigation);
          }),
    );
  }

  PreferredSizeWidget _niaAppBar() => AppBar();

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

  Future _navigateToDestination(
      NavigatorState navigator, TopLevelNavigation navigation) async {
    switch (navigation) {
      case TopLevelNavigation.forYou:
        navigateToForYouPage(navigator);
      case TopLevelNavigation.bookMark:
        navigateToBookMarkedPage(navigator);
      default:
        Future.value();
    }
  }
}
