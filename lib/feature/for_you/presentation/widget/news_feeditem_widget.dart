import 'package:flutter/material.dart';
import 'package:news/core/data/model/news_recsource.dart';

class NewsFeedItemWidget extends StatelessWidget {
  const NewsFeedItemWidget({super.key, required this.newsResource});

  final NewsResource newsResource;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(newsResource.id),
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 16),
          Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Row(children: [
                    Expanded(flex: 4, child: Text(newsResource.title)),
                    Expanded(flex: 1, child: SizedBox()),
                    IconButton(onPressed: null, icon: Icon(Icons.bookmark_add)),
                  ]),
                  SizedBox(height: 16),
                ]
              )
          )
        ],
      ),
    );
  }
}
