import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/data/model/topic.dart';
import 'package:news/core/design_system/common_widget/news_feeditem_widget.dart';
import 'package:news/feature/topic/bloc/topic_bloc.dart';
import 'package:news/feature/topic/bloc/topic_ui_state.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TopicBloc, TopicUiState>(
          builder: (context, state) {
            final followedTopic = state.followedTopic;
            final newsResourcesInTopic = state.newsResourcesInTopic;
            final bookmarkedNewsId = state.bookmarkedNewsId;
            final followedTopicId = state.followedTopicIds;
            if (followedTopic == null) {
              return const SizedBox();
            }

            return CustomScrollView(
              slivers: [
                _buildAppBar(
                    context: context,
                    followed: followedTopic.isFollowed,
                    onSavedButtonClick: () {
                      context.read<TopicBloc>().add(OnTopicFollowedStateChanged(
                          !followedTopic.isFollowed));
                    }),
                SliverToBoxAdapter(
                    child: _buildTopicHeader(
                        context: context, topic: followedTopic.topic)),
                SliverList.builder(
                    itemCount: newsResourcesInTopic.length,
                    itemBuilder: (context, index) => NewsFeedItemWidget(
                          newsResource: newsResourcesInTopic[index],
                          isSaved: bookmarkedNewsId
                              .contains(newsResourcesInTopic[index].id),
                          followedTopicIds: followedTopicId,
                          onSavedStateChanged:
                              (String newsResourceId, bool isSaved) {
                            context.read<TopicBloc>().add(
                                OnNewsBookMarkedStateChanged(
                                    newsResId: newsResourceId,
                                    isSaved: isSaved));
                          },
                        ))
              ],
            );
          },
          listener: (context, state) {}),
    );
  }

  Widget _buildAppBar(
      {required bool followed,
      required BuildContext context,
      required VoidCallback onSavedButtonClick}) {
    final buttonLeadingIcon =
        followed ? const Icon(Icons.check) : const SizedBox();
    final buttonLabel = followed ? 'FOLLOWING' : 'NOT FOLLOWING';
    return SliverAppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          icon: const Icon(Icons.arrow_back)),
      actions: [
        TextButton(
            onPressed: onSavedButtonClick,
            child: Row(children: [buttonLeadingIcon, Text(buttonLabel)]))
      ],
    );
  }

  Widget _buildTopicHeader(
      {required BuildContext context, required Topic topic}) {
    return Column(
      children: [
        const SizedBox(height: 24),
        SizedBox.square(
            dimension: 216, child: SvgPicture.network(topic.imageUrl)),
        const SizedBox(height: 24),
        Text(topic.name, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 24),
        Text(topic.shortDescription,
            style: Theme.of(context).textTheme.titleMedium)
      ],
    );
  }
}
