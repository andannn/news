import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class TopicModel {
  final String id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final String url;
  final String imageUrl;
  final bool followed;

  const TopicModel(
      {this.id = "",
      this.name = "",
      this.shortDescription = "",
      this.longDescription = "",
      this.url = "",
      this.imageUrl = "",
      this.followed = false});

  factory TopicModel.fromJson(Map<String, dynamic> json) =>
      _$TopicModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicModelToJson(this);
}
