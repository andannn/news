import 'package:flutter/material.dart';
import 'package:news/app/navigation/nia_route_path.dart';
import 'package:news/feature/for_you/for_you_page.dart';

Page createForYouPageRoute() =>
    const MaterialPage(key: ValueKey(ForYouRoutePath), child: ForYouPage());
