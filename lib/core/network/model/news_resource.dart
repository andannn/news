import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'news_resource_type.dart';

part 'news_resource.g.dart';

@immutable
@JsonSerializable()
class NewsResourceDto {
  final String id;
  final String title;
  final String content;
  final String url;
  final String headerImageUrl;
  final DateTime? publishDate;
  final NewsResourceType type;
  final List<String> topics;

  const NewsResourceDto(
      {this.id = '',
      this.title = '',
      this.content = '',
      this.url = '',
      this.headerImageUrl = '',
      this.type = NewsResourceType.unknown,
      this.publishDate,
      this.topics = const []});

  factory NewsResourceDto.fromJson(Map<String, dynamic> json) =>
      _$NewsResourceFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResourceToJson(this);
}
