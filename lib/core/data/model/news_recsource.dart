import 'package:news/core/data/model/topic.dart';
import 'package:news/core/database/model/news_resource_entity.dart';
import 'package:news/core/database/model/populated_news_resource.dart';

import '../../network/model/news_resource_type.dart';

final class NewsResource {
  final String id;
  final String title;
  final String content;
  final String url;
  final String? headerImageUrl;
  final DateTime? publishDate;

  final NewsResourceType type;

  final List<Topic> topics;

  const NewsResource(
      {required this.id,
      this.title = '',
      this.content = '',
      this.url = '',
      this.headerImageUrl,
      this.publishDate,
      this.type = NewsResourceType.unknown,
      this.topics = const []});

  NewsResource.fromEntity(PopulatedNewsResource populatedNewsEntity)
      : id = populatedNewsEntity.entity.id.toString(),
        title = populatedNewsEntity.entity.title,
        content = populatedNewsEntity.entity.content,
        url = populatedNewsEntity.entity.url,
        headerImageUrl = populatedNewsEntity.entity.headerImageUrl,
        publishDate = populatedNewsEntity.entity.publishDate,
        type = populatedNewsEntity.entity.type,
        topics =
            populatedNewsEntity.topics.map((e) => Topic.fromEntity(e)).toList();

  NewsResource.fromEntityTest(NewsResourceEntity entity)
      : id = entity.id.toString(),
        title = entity.title,
        content = entity.content,
        url = entity.url,
        headerImageUrl = entity.headerImageUrl,
        publishDate = entity.publishDate,
        type = entity.type,
        topics = [];
}
