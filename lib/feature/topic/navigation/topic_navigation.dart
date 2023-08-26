import 'package:flutter/material.dart';
import '../topic_page.dart';

Page createTopicPage(String topicId) => MaterialPage(
    key: ValueKey('TopicRoutePath($topicId)'), child: TopicPage(topicId: topicId));
