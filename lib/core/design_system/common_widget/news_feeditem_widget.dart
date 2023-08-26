
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/data/model/news_recsource.dart';
import 'package:news/core/data/model/topic.dart';

class NewsFeedItemWidget extends StatelessWidget {
  const NewsFeedItemWidget(
      {super.key,
      required this.newsResource,
      required this.isSaved,
      required this.onSavedStateChanged,
      required this.followedTopicIds});

  final NewsResource newsResource;
  final bool isSaved;
  final List<String> followedTopicIds;
  final Function(String newsResourceId, bool isSaved) onSavedStateChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(newsResource.id),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildNetWorkImageResource(context, newsResource.headerImageUrl),
          const SizedBox(height: 8),
          Padding(
              padding: const EdgeInsets.all(24),
              child: Column(children: [
                const SizedBox(height: 16),
                Row(children: [
                  Expanded(
                      flex: 8,
                      child: Text(newsResource.title,
                          style: Theme.of(context).textTheme.titleLarge)),
                  const Expanded(flex: 1, child: SizedBox()),
                  _buildBookMarkButton(
                      isSaved: isSaved,
                      onSavedStateChanged: (saved) {
                        onSavedStateChanged(newsResource.id, saved);
                      }),
                ]),
                const SizedBox(height: 16),
                _buildNewsResourceMetaData(context, newsResource.publishDate!,
                    newsResource.type.displayText),
                const SizedBox(height: 16),
                Text(newsResource.content,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 16),
                _buildNewsResourceTopics(
                    context, newsResource.topics, followedTopicIds)
              ]))
        ],
      ),
    );
  }

  Widget _buildNetWorkImageResource(
      BuildContext context, String? headerImageUrl) {
    if (headerImageUrl == null || headerImageUrl.isEmpty) {
      return const SizedBox();
    } else {
      Widget getInitialWidget(BuildContext context) => SvgPicture.asset(
            'assets/image/ic_placeholder_default.xml',
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          );

      return CachedNetworkImage(
          height: 180,
          width: double.infinity,
          placeholder: (context, _) => getInitialWidget(context),
          fit: BoxFit.cover,
          imageUrl: headerImageUrl,
          errorWidget: (context, _, e) => getInitialWidget(context));
    }
  }

  Widget _buildBookMarkButton(
      {required bool isSaved,
      required Function(bool isSaved) onSavedStateChanged}) {
    final iconData = isSaved ? Icons.bookmark : Icons.bookmark_add_outlined;
    return IconButton(
        onPressed: () => onSavedStateChanged.call(!isSaved),
        icon: Icon(iconData));
  }

  Widget _buildNewsResourceMetaData(
      BuildContext context, DateTime publishDate, String displayText) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text('${publishDate.toString()} · $displayText',
            style: Theme.of(context).textTheme.labelSmall));
  }

  Widget _buildNewsResourceTopics(
      BuildContext context, List<Topic> topics, List<String> followedTopicIds) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
          spacing: 10,
          children: topics
              .map((topic) => buildNiaTopicTag(
                  context: context,
                  topic: topic,
                  isFollowed: followedTopicIds.contains(topic.id)))
              .toList()),
    );
  }

  Widget buildNiaTopicTag(
      {required BuildContext context,
      required Topic topic,
      required bool isFollowed}) {
    Color containerColor;
    if (isFollowed) {
      containerColor = Theme.of(context).colorScheme.primaryContainer;
    } else {
      containerColor =
          Theme.of(context).colorScheme.primaryContainer.withAlpha(80);
    }
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: containerColor,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer),
        child: Text(topic.name.toUpperCase()));
  }
}
