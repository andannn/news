// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsResourceDto _$$_NewsResourceDtoFromJson(Map<String, dynamic> json) =>
    _$_NewsResourceDto(
      id: json['id'] as String? ?? "",
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      url: json['url'] as String? ?? "",
      headerImageUrl: json['headerImageUrl'] as String? ?? "",
      type: $enumDecodeNullable(_$NewsResourceTypeEnumMap, json['type']) ??
          NewsResourceType.unknown,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      topics: (json['topics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_NewsResourceDtoToJson(_$_NewsResourceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'url': instance.url,
      'headerImageUrl': instance.headerImageUrl,
      'type': _$NewsResourceTypeEnumMap[instance.type]!,
      'publishDate': instance.publishDate?.toIso8601String(),
      'topics': instance.topics,
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
