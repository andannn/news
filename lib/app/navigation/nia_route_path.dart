import 'package:flutter/material.dart';
import 'package:news/app/navigation/top_level_navigation.dart';
import 'package:news/feature/book_marked/navigation/book_marked_navigation.dart';
import 'package:news/feature/for_you/navigation/for_you_navigation.dart';
import 'package:news/feature/interests/navigation/interests_navigation.dart';

sealed class NiaRoutePath {}

abstract class TopLevelRoutePath extends NiaRoutePath {
  final TopLevelNavigation topLevel;

  TopLevelRoutePath(this.topLevel);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopLevelRoutePath &&
          runtimeType == other.runtimeType &&
          topLevel == other.topLevel;

  @override
  int get hashCode => topLevel.hashCode;
}

class ForYouRoutePath extends TopLevelRoutePath {
  ForYouRoutePath() : super(TopLevelNavigation.forYou);
}

class BookMarkedRoutePath extends TopLevelRoutePath {
  BookMarkedRoutePath() : super(TopLevelNavigation.bookMark);
}

class InterestsRoutePath extends TopLevelRoutePath {
  InterestsRoutePath() : super(TopLevelNavigation.interests);
}

extension NiaRoutePathEx on NiaRoutePath {
  Page generatePage() {
    if (this is ForYouRoutePath) {
      return createForYouPageRoute();
    } else if (this is BookMarkedRoutePath) {
      return createBookMarkedPage();
    } else if (this is InterestsRoutePath) {
      return createInterestsPage();
    } else {
      return const MaterialPage(child: SizedBox());
    }
  }
}