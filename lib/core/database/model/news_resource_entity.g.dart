// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_resource_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResourceEntity _$NewsResourceEntityFromJson(Map<String, dynamic> json) =>
    NewsResourceEntity(
      id: json['id'] as String? ?? "",
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      url: json['url'] as String? ?? "",
      headerImageUrl: json['headerImageUrl'] as String? ?? "",
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      type: $enumDecodeNullable(_$NewsResourceTypeEnumMap, json['type']) ??
          NewsResourceType.unknown,
    );

Map<String, dynamic> _$NewsResourceEntityToJson(NewsResourceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'url': instance.url,
      'headerImageUrl': instance.headerImageUrl,
      'publishDate': instance.publishDate?.toIso8601String(),
      'type': _$NewsResourceTypeEnumMap[instance.type]!,
    };

const _$NewsResourceTypeEnumMap = {
  NewsResourceType.video: 'Video 📺',
  NewsResourceType.apiChange: 'API change',
  NewsResourceType.jetpackRelease: 'Jetpack release 🚀',
  NewsResourceType.article: 'Article 📚',
  NewsResourceType.codelab: 'Codelab',
  NewsResourceType.podcast: 'Podcast 🎙',
  NewsResourceType.docs: 'Docs 📑',
  NewsResourceType.event: 'Event 📆',
  NewsResourceType.dac: 'DAC - Android version features',
  NewsResourceType.unknown: '',
};
