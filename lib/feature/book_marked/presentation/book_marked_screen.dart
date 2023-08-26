import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/design_system/common_widget/nia_snackbar.dart';
import 'package:news/feature/book_marked/bloc/book_marked_bloc.dart';
import 'package:news/feature/book_marked/bloc/book_marked_news_state.dart';
import 'package:news/core/design_system/common_widget/news_feeditem_widget.dart';
import 'package:news/feature/book_marked/bloc/book_marked_ui_state.dart';

import '../../../app/local/nia_localizations.dart';
import '../../../core/data/model/news_recsource.dart';

class BookMarkedScreen extends StatelessWidget {
  const BookMarkedScreen({super.key, required this.onNewsRemoved});

  final Function(String removedId) onNewsRemoved;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<BookMarkedBloc, BookMarkedUiState>(
          builder: (context, state) {
            final followedTopicIds = state.followedTopicIds;
            final bookMarkedNewsState = state.bookMarkedNewsState;
            if (bookMarkedNewsState.runtimeType == BookMarkedReady &&
                (bookMarkedNewsState as BookMarkedReady)
                    .bookMarkedResource
                    .isNotEmpty) {
              return _BookMarksGrid(
                resources: bookMarkedNewsState.bookMarkedResource,
                followedTopicIds: followedTopicIds,
                onNewsRemoved: onNewsRemoved,
              );
            } else {
              return const _EmptyBookMarkedState();
            }
          },
          listener: (context, state) {}),
    );
  }
}

class _BookMarksGrid extends StatelessWidget {
  const _BookMarksGrid(
      {super.key,
      required this.resources,
      required this.followedTopicIds,
      required this.onNewsRemoved});

  final List<NewsResource> resources;
  final List<String> followedTopicIds;
  final Function(String removedId) onNewsRemoved;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
            itemCount: resources.length,
            itemBuilder: (context, index) => NewsFeedItemWidget(
                  newsResource: resources[index],
                  isSaved: true,
                  followedTopicIds: followedTopicIds,
                  onSavedStateChanged: (String newsResourceId, bool isSaved) {
                    if (isSaved) {
                      // Do nothing if news saved in this page.
                      return Future.value(null);
                    }
                    onNewsRemoved(newsResourceId);
                  },
                ))
      ],
    );
  }
}

class _EmptyBookMarkedState extends StatelessWidget {
  const _EmptyBookMarkedState({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset('assets/image/ic_book_marked.xml'),
        const SizedBox(height: 64),
        Text(
          NiaLocalizations.of(context).bookmarksEmptyError,
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Text(
          NiaLocalizations.of(context).bookmarksEmptyDescription,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium,
        ),
      ]),
    );
  }
}
