// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopicEntity _$$_TopicEntityFromJson(Map<String, dynamic> json) =>
    _$_TopicEntity(
      id: json['id'] as int?,
      name: json['name'] as String? ?? "",
      shortDescription: json['shortDescription'] as String? ?? "",
      longDescription: json['longDescription'] as String? ?? "",
      url: json['url'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
    );

Map<String, dynamic> _$$_TopicEntityToJson(_$_TopicEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
    };
