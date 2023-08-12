import 'package:json_annotation/json_annotation.dart';
import 'package:news/core/network/model/news_resource.dart';

part 'topic_entity.g.dart';

@JsonSerializable()
class TopicEntity {
  final int? id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final String url;
  final String imageUrl;

  const TopicEntity({
    this.id,
    this.name = "",
    this.shortDescription = "",
    this.longDescription = "",
    this.url = "",
    this.imageUrl = "",
  });

  static List<TopicEntity> fromNewsDto(NewsResourceDto newsDto) =>
      newsDto.topics
          .map((topicId) => TopicEntity(id: int.parse(topicId)))
          .toList();

  factory TopicEntity.fromJson(Map<String, dynamic> json) =>
      _$TopicEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TopicEntityToJson(this);
}
