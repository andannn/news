// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicEntity _$TopicEntityFromJson(Map<String, dynamic> json) => TopicEntity(
      id: json['id'] as int?,
      name: json['name'] as String? ?? "",
      shortDescription: json['shortDescription'] as String? ?? "",
      longDescription: json['longDescription'] as String? ?? "",
      url: json['url'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
    );

Map<String, dynamic> _$TopicEntityToJson(TopicEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
    };
