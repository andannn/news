import 'package:flutter/material.dart';
import '../../../app/navigation/nia_route_path.dart';
import '../interests_page.dart';

Page createInterestsPage() => const MaterialPage(
    key: ValueKey(InterestsRoutePath), child: InterestsPage());
