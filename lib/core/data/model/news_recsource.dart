import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/data/model/topic.dart';
import 'package:news/core/database/model/news_resource_entity.dart';
import 'package:news/core/database/model/populated_news_resource.dart';

import '../../network/model/news_resource_type.dart';

part 'news_recsource.freezed.dart';

@freezed
class NewsResource with _$NewsResource {
  factory NewsResource(
      {required String id,
      @Default('') String title,
      @Default('') String content,
      @Default('') String url,
      String? headerImageUrl,
      DateTime? publishDate,
      @Default(NewsResourceType.unknown) NewsResourceType type,
      @Default([]) List<Topic> topics}) = _NewsResource;

  static NewsResource fromEntity(PopulatedNewsResource populatedNewsEntity) =>
      NewsResource(
          id: populatedNewsEntity.entity.id.toString(),
          title: populatedNewsEntity.entity.title,
          content: populatedNewsEntity.entity.content,
          url: populatedNewsEntity.entity.url,
          headerImageUrl: populatedNewsEntity.entity.headerImageUrl,
          publishDate: populatedNewsEntity.entity.publishDate,
          type: populatedNewsEntity.entity.type,
          topics: populatedNewsEntity.topics
              .map((e) => Topic.fromEntity(e))
              .toList());

  static NewsResource fromEntityTest(NewsResourceEntity entity) => NewsResource(
      id: entity.id.toString(),
      title: entity.title,
      content: entity.content,
      url: entity.url,
      headerImageUrl: entity.headerImageUrl,
      publishDate: entity.publishDate,
      type: entity.type,
      topics: []);
}
