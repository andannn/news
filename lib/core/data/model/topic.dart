import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/database/model/topic_entity.dart';

part 'topic.freezed.dart';

@freezed
class Topic with _$Topic {

  factory Topic(
      {required String id,
      @Default("") String name,
      @Default("") String shortDescription,
      @Default("") String longDescription,
      @Default("") String url,
      @Default("") String imageUrl}) = _Topic;

  static Topic fromEntity(TopicEntity entity) => Topic(
      id: entity.id!.toString(),
      name: entity.name,
      shortDescription: entity.shortDescription,
      longDescription: entity.longDescription,
      url: entity.url,
      imageUrl: entity.imageUrl);
}
