import 'package:json_annotation/json_annotation.dart';

part 'topic_entity.g.dart';

@JsonSerializable()
class TopicEntity {
  final int? id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final String url;
  final String imageUrl;

  const TopicEntity(
      {this.id,
        this.name = "",
        this.shortDescription = "",
        this.longDescription = "",
        this.url = "",
        this.imageUrl = "",});

  factory TopicEntity.fromJson(Map<String, dynamic> json) =>
      _$TopicEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TopicEntityToJson(this);
}
