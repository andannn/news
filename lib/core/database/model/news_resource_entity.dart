import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news/core/network/model/news_resource.dart';
import 'package:news/core/network/model/topic.dart';

import '../../network/model/news_resource_type.dart';

part 'news_resource_entity.freezed.dart';

part 'news_resource_entity.g.dart';

@freezed
class NewsResourceEntity with _$NewsResourceEntity {

  factory NewsResourceEntity({
    @Default(-1) int id,
    @Default("") String title,
    @Default("") String content,
    @Default("") String url,
    @JsonKey(name: 'header_image_url') @Default("") String headerImageUrl,
    @JsonKey(name: 'publish_date') @Default(null) DateTime? publishDate,
    @Default(NewsResourceType.unknown) NewsResourceType type,
  }) = _NewsResourceEntity;

  static NewsResourceEntity fromDto(NewsResourceDto dto) {
    return NewsResourceEntity(
      id : int.parse(dto.id),
        title : dto.title,
        content : dto.content,
        headerImageUrl : dto.headerImageUrl,
        publishDate : dto.publishDate,
        url : dto.url,
        type : dto.type
    );
  }

  factory NewsResourceEntity.fromJson(Map<String, dynamic> json) =>
      _$NewsResourceEntityFromJson(json);
}
