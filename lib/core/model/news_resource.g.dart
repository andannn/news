// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResource _$NewsResourceFromJson(Map<String, dynamic> json) => NewsResource(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      content: json['content'] as String? ?? '',
      url: json['url'] as String? ?? '',
      headerImageUrl: json['headerImageUrl'] as String? ?? '',
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      topics: (json['topics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$NewsResourceToJson(NewsResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'url': instance.url,
      'headerImageUrl': instance.headerImageUrl,
      'publishDate': instance.publishDate?.toIso8601String(),
      'topics': instance.topics,
    };
