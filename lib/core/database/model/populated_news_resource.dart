import 'package:news/core/database/model/topic_entity.dart';

import 'news_resource_entity.dart';

class PopulatedNewsResource {
  final NewsResourceEntity entity;
  final List<TopicEntity> topics;

  const PopulatedNewsResource({required this.entity, required this.topics});
}
