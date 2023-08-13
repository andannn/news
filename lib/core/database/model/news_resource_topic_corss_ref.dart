import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/network/model/news_resource.dart';

part 'news_resource_topic_corss_ref.freezed.dart';

part 'news_resource_topic_corss_ref.g.dart';

@freezed
class NewsResourceTopicCrossRef with _$NewsResourceTopicCrossRef {
  factory NewsResourceTopicCrossRef(
          {@JsonKey(name: "news_resource_id") required String newsResourceId,
          @JsonKey(name: "topic_id") required String topicId}) =
      _NewsResourceTopicCrossRef;

  static List<NewsResourceTopicCrossRef> fromDto(NewsResourceDto dto) => dto
      .topics
      .map((topicId) =>
          NewsResourceTopicCrossRef(newsResourceId: dto.id, topicId: topicId))
      .toList();

  factory NewsResourceTopicCrossRef.fromJson(Map<String, dynamic> json) =>
      _$NewsResourceTopicCrossRefFromJson(json);
}
