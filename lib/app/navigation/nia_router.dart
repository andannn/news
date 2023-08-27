import 'package:flutter/material.dart';
import 'package:news/app/navigation/top_level_navigation.dart';
import 'nia_route_path.dart';

class NiaRouterDelegate extends RouterDelegate<NiaRoutePath>
    with ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  NavigatorState? get navigator => _navigatorKey.currentState;

  RouteObserver routeObserver = RouteObserver();

  List<NiaRoutePath> _backStack = [ForYouRoutePath()];

  /// get current path.
  NiaRoutePath get currentPath => _backStack.last;

  /// get current top level.
  TopLevelNavigation get currentTopLevelNavigation =>
      _backStack
          .whereType<TopLevelRoutePath>()
          .last
          .topLevel;

  bool get needShowTopAppBar => _backStack.last is TopLevelRoutePath;

  static NiaRouterDelegate of(context) =>
      Router
          .of(context)
          .routerDelegate as NiaRouterDelegate;

  @override
  Widget build(BuildContext context) {
    print(_backStack.map((path) => path.generatePage()).toList());
    return Navigator(
      key: navigatorKey,
      pages: _backStack.map((path) => path.generatePage()).toList(),
      onPopPage: _onPopPage,
      observers: [routeObserver],
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}

  /// Judgment of whether need to pop current page.
  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    _backStack.removeLast();
    notifyListeners();
    return true;
  }

  @override
  Future<bool> popRoute() async {
    if (currentPath is ForYouRoutePath) {
      // Already in last page, nothing to do, just quit app.
      return false;
    }

    navigator?.pop();
    return true;
  }

  void navigateToTopLevelPage(TopLevelNavigation navigation) {
    if (navigation == TopLevelNavigation.forYou) {
      _backStack = [ForYouRoutePath()];
    } else {
      _backStack = [ForYouRoutePath(), navigation.toRoutePath()];
    }

    notifyListeners();
  }

  void navigateToTopicDetail(String topicId) {
    _backStack += [TopicRoutePath(topicId)];

    notifyListeners();
  }
}
