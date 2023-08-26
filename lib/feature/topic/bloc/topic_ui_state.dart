import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/core/data/model/news_recsource.dart';

part 'topic_ui_state.freezed.dart';

@freezed
class TopicUiState with _$TopicUiState {
  factory TopicUiState({
    FollowableTopic? followedTopic,
    @Default([]) List<NewsResource> newsResourcesInTopic,
    @Default([]) List<String> bookmarkedNewsId,
    @Default([]) List<String> followedTopicIds,
  }) = _TopicUiState;
}
