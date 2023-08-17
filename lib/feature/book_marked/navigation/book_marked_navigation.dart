import 'package:flutter/material.dart';
import 'package:news/app/navigation/nia_route_path.dart';
import 'package:news/feature/book_marked/book_marked_page.dart';

Page createBookMarkedPage() => const MaterialPage(
    key: ValueKey(BookMarkedRoutePath), child: BookMarkedPage());
