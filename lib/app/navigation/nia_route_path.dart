import 'package:flutter/material.dart';
import 'package:news/app/navigation/top_level_navigation.dart';
import 'package:news/feature/book_marked/navigation/book_marked_navigation.dart';
import 'package:news/feature/for_you/navigation/for_you_navigation.dart';
import 'package:news/feature/interests/navigation/interests_navigation.dart';
import 'package:news/feature/topic/navigation/topic_navigation.dart';

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

class TopicRoutePath extends NiaRoutePath {
  TopicRoutePath(this.topicId);
  final String topicId;
}

extension NiaRoutePathEx on NiaRoutePath {
  Page generatePage() {
    if (this is ForYouRoutePath) {
      return forYouPage;
    } else if (this is BookMarkedRoutePath) {
      return bookMarkedPage;
    } else if (this is InterestsRoutePath) {
      return interestsPage;
    } else if (this is TopicRoutePath) {
      return createTopicPage((this as TopicRoutePath).topicId);
    }else {
      return const MaterialPage(child: SizedBox());
    }
  }
}