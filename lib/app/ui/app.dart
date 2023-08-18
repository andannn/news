import 'package:flutter/material.dart';
import 'package:news/app/navigation/nia_router.dart';
import 'package:news/app/navigation/top_level_navigation.dart';

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

  @override
  void initState() {
    super.initState();
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
      body: Router(
          routerDelegate: niaRouterDelegate,
          backButtonDispatcher: RootBackButtonDispatcher()),
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
