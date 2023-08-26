import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/core/data/model/followable_topic.dart';

part 'interests_ui_state.freezed.dart';

@freezed
class InterestsUiState with _$InterestsUiState {
  factory InterestsUiState({
        @Default([]) List<FollowableTopic> topics}) = _InterestsUiState;
}
