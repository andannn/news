import 'package:flutter/material.dart';
import 'package:news/feature/book_marked/navigation/book_marked_navigation.dart';

import '../../feature/for_you/navigation/for_you_navigation.dart';

class NiaRouter extends StatelessWidget {

  const NiaRouter({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Router(
        routerDelegate: NiaRouterDelegate(navigatorKey),
        backButtonDispatcher: RootBackButtonDispatcher()
    );
  }
}

class NiaRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier {

  NiaRouterDelegate(this._navigatorKey);

  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        initialRoute: forYouRouteName,
        onGenerateRoute: _onGenerateRoute,
        onPopPage: _onPopPage,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case forYouRouteName:
        return createForYouPageRoute();
      case bookMarkedRouteName:
        return createBookMarkedPage();
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
  }


  bool _onPopPage(Route<dynamic> route, result) {
    return true;
  }

  @override
  Future<bool> popRoute() async {
    print("JQN popRoute");
    return true;
  }
}
