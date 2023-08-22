import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/core/data/model/news_recsource.dart';

class NewsFeedItemWidget extends StatelessWidget {
  const NewsFeedItemWidget({super.key, required this.newsResource});

  final NewsResource newsResource;

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
                  Expanded(flex: 5, child: Text(newsResource.title)),
                  const Expanded(flex: 1, child: SizedBox()),
                  IconButton(onPressed: null, icon: Icon(Icons.bookmark_add)),
                ]),
                const SizedBox(height: 16),
                Text(newsResource.content),
                const SizedBox(height: 16),
              ]))
        ],
      ),
    );
  }
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
