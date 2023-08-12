import 'package:json_annotation/json_annotation.dart';
import 'package:news/core/network/model/news_resource.dart';

part 'news_resource_topic_corss_ref.g.dart';

@JsonSerializable()
class NewsResourceTopicCrossRef {
  @JsonKey(name: "news_resource_id") // Foreign key of news_resource table.
  final String newsResourceId;

  @JsonKey(name: "topic_id")
  final String topicId; // Foreign key of topic table.

  const NewsResourceTopicCrossRef(
      {required this.newsResourceId, required this.topicId});

  static List<NewsResourceTopicCrossRef> fromDto(NewsResourceDto dto) => dto
      .topics
      .map((topicId) =>
          NewsResourceTopicCrossRef(newsResourceId: dto.id, topicId: topicId))
      .toList();

  factory NewsResourceTopicCrossRef.fromJson(Map<String, dynamic> json) =>
      _$NewsResourceTopicCrossRefFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResourceTopicCrossRefToJson(this);
}
