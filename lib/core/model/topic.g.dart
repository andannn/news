// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicModel _$TopicModelFromJson(Map<String, dynamic> json) => TopicModel(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      shortDescription: json['shortDescription'] as String? ?? "",
      longDescription: json['longDescription'] as String? ?? "",
      url: json['url'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      followed: json['followed'] as bool? ?? false,
    );

Map<String, dynamic> _$TopicModelToJson(TopicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'followed': instance.followed,
    };
