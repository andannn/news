import 'package:json_annotation/json_annotation.dart';

import '../../network/model/news_resource_type.dart';

part 'news_resource_entity.g.dart';

@JsonSerializable()
class NewsResourceEntity {
  final int id;
  final String title;
  final String content;
  final String url;
  @JsonKey(name: 'header_image_url')
  final String? headerImageUrl;
  @JsonKey(name: 'publish_date')
  final DateTime? publishDate;
  final NewsResourceType type;

  const NewsResourceEntity({
    required this.id,
    this.title = "",
    this.content = "",
    this.url = "",
    this.headerImageUrl = "",
    this.publishDate,
    this.type = NewsResourceType.unknown,
  });

  factory NewsResourceEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsResourceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResourceEntityToJson(this);
}
