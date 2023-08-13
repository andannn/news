import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/database/model/topic_entity.dart';

import 'news_resource_entity.dart';

part 'populated_news_resource.freezed.dart';

@freezed
class PopulatedNewsResource with _$PopulatedNewsResource {
  factory PopulatedNewsResource(
      {required NewsResourceEntity entity,
      required List<TopicEntity> topics}) = _PopulatedNewsResource;
}
