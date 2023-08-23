import 'package:equatable/equatable.dart';
import 'package:news/core/data/model/news_recsource.dart';

sealed class NewsFeedState extends Equatable {
  const NewsFeedState();
}

class NewsFeedLoading extends NewsFeedState {
  const NewsFeedLoading();

  @override
  List<Object?> get props => [];
}

class NewsFeedLoadSuccess extends NewsFeedState {
  final List<NewsResource> feed;

  NewsFeedLoadSuccess(this.feed);

  @override
  List<Object?> get props => [feed];
}
