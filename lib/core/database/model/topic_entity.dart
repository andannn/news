import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/network/model/news_resource.dart';

part 'topic_entity.g.dart';
part 'topic_entity.freezed.dart';

@freezed
class TopicEntity with _$TopicEntity {

  factory TopicEntity({
    int? id,
    @Default("") String name,
    @Default("") String shortDescription,
    @Default("") String longDescription,
    @Default("") String url,
    @Default("") String imageUrl,
  }) = _TopicEntity;

  static List<TopicEntity> fromNewsDto(NewsResourceDto newsDto) =>
      newsDto.topics
          .map((topicId) => TopicEntity(id: int.parse(topicId)))
          .toList();

  factory TopicEntity.fromJson(Map<String, dynamic> json) =>
      _$TopicEntityFromJson(json);
}
