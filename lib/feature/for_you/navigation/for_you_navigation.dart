
import 'package:flutter/material.dart';

import '../for_you_page.dart';

const String forYouRouteName = '/';

Future navigateToForYouPage(NavigatorState navigator) => navigator
    .pushNamedAndRemoveUntil(forYouRouteName, (route) => true);

Route createForYouPageRoute() => MaterialPageRoute(
    settings: const RouteSettings(name: forYouRouteName, arguments: null),
    builder: (_) => const ForYouPage());
