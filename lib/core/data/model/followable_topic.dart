import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/data/model/topic.dart';

part 'followable_topic.freezed.dart';

@freezed
class FollowableTopic with _$FollowableTopic {
  factory FollowableTopic(Topic topic, bool isFollowed) = _FollowableTopic;
}
