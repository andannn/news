// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopicDto _$$_TopicDtoFromJson(Map<String, dynamic> json) => _$_TopicDto(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      shortDescription: json['shortDescription'] as String? ?? "",
      longDescription: json['longDescription'] as String? ?? "",
      url: json['url'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      followed: json['followed'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TopicDtoToJson(_$_TopicDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'followed': instance.followed,
    };
