import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class TopicDto {
  final String id;
  final String name;
  final String shortDescription;
  final String longDescription;
  final String url;
  final String imageUrl;
  final bool followed;

  const TopicDto(
      {this.id = "",
      this.name = "",
      this.shortDescription = "",
      this.longDescription = "",
      this.url = "",
      this.imageUrl = "",
      this.followed = false});

  factory TopicDto.fromJson(Map<String, dynamic> json) =>
      _$TopicDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TopicDtoToJson(this);
}
