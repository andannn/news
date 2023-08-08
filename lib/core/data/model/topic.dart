import 'package:news/core/database/model/topic_entity.dart';

final class Topic {
  final String id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final String url;
  final String imageUrl;

  const Topic(
      {required this.id,
      this.name = '',
      this.shortDescription = '',
      this.longDescription = '',
      this.url = '',
      this.imageUrl = ''});

  Topic.fromEntity(TopicEntity entity)
      : id = entity.id!.toString(),
        name = entity.name,
        shortDescription = entity.shortDescription,
        longDescription = entity.longDescription,
        url = entity.url,
        imageUrl = entity.imageUrl;
}
