import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/feature/for_you/bloc/for_you_bloc.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';
import 'package:news/feature/for_you/bloc/news_feed_state.dart';
import 'package:news/feature/for_you/presentation/on_boarding.dart';

import 'widget/news_feeditem_widget.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForYouBloc, ForYouUiState>(
      builder: (BuildContext context, ForYouUiState state) {
        final newsFeedState = state.newsFeedState;
        final bookMarkedIds = state.bookmarkedNewsIds;
        final followedTopicIds = state.followedTopicIds;
        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: OnBoarding()),
            _createSliverNewsFeed(
                context, newsFeedState, bookMarkedIds, followedTopicIds),
          ],
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  Widget _createSliverNewsFeed(BuildContext context, NewsFeedState state,
      List<String> bookMarkedIds, List<String> followedTopicIds) {
    List<NewsResource> resources = [];

    if (state is NewsFeedLoadSuccess) {
      resources = state.feed;
    }
    return SliverList.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) => NewsFeedItemWidget(
              newsResource: resources[index],
              isSaved: bookMarkedIds.contains(resources[index].id),
              followedTopicIds: followedTopicIds,
              onSavedStateChanged: (String newsResourceId, bool isSaved) {
                context.read<ForYouBloc>().add(OnNewsBookMarkedStateChanged(
                    newsResId: newsResourceId, isSaved: isSaved));
              },
            ));
  }
}
