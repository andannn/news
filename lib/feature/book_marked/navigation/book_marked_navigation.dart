import 'package:flutter/material.dart';

import '../../for_you/navigation/for_you_navigation.dart';
import '../book_marked_page.dart';

const String bookMarkedRouteName = '/book_marked';

// Future navigateToBookMarkedPage(NavigatorState navigator) =>
//     navigator.pushNamedAndRemoveUntil(
//         bookMarkedRouteName, (route) => route.settings.name == forYouRouteName);

Future navigateToBookMarkedPage(NavigatorState navigator) =>
    navigator.pushNamed(bookMarkedRouteName);

Route createBookMarkedPage() => MaterialPageRoute(
    settings: const RouteSettings(name: bookMarkedRouteName, arguments: null),
    builder: (_) => const BookMarkedPage());
