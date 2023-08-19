import 'package:equatable/equatable.dart';

sealed class ForYouPageEvent extends Equatable {
  const ForYouPageEvent();
}

class OnUpdateTopicSelection extends ForYouPageEvent {
  final String topicId;
  final bool isChecked;

  const OnUpdateTopicSelection(this.topicId, this.isChecked);

  @override
  List<Object?> get props => [topicId, isChecked];
}
