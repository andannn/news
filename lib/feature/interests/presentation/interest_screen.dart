import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/app/local/nia_localizations.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/feature/interests/bloc/interests_bloc.dart';
import 'package:news/feature/interests/bloc/interests_ui_state.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InterestBloc, InterestsUiState>(
          builder: (context, state) {
            final followableTopics = state.topics;
            if (followableTopics.isEmpty) {
              return const _InterestsEmptyScreen();
            } else {
              return CustomScrollView(
                slivers: [
                  SliverList.builder(
                      itemCount: followableTopics.length,
                      itemBuilder: (context, index) => _TopicItemWidget(
                            followableTopic: followableTopics[index],
                            onSaveButtonCheckStateChanged:
                                (String topicId, bool checked) {
                              context.read<InterestBloc>().add(
                                  OnUpdateTopicSelection(topicId, checked));
                            },
                            onTopicItemClick: () {

                            },
                          ))
                ],
              );
            }
          },
          listener: (context, state) {}),
    );
  }
}

class _InterestsEmptyScreen extends StatelessWidget {
  const _InterestsEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(NiaLocalizations.of(context).emptyHeader,
          style: Theme.of(context).textTheme.labelLarge),
    );
  }
}

class _TopicItemWidget extends StatelessWidget {
  const _TopicItemWidget(
      {super.key,
      required this.followableTopic,
      required this.onSaveButtonCheckStateChanged,
      required this.onTopicItemClick});

  final FollowableTopic followableTopic;
  final Function(String topicId, bool checked) onSaveButtonCheckStateChanged;
  final VoidCallback onTopicItemClick;

  IconData get iconData =>
      followableTopic.isFollowed ? Icons.check_circle : Icons.add;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTopicItemClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(children: [
          SvgPicture.network(followableTopic.topic.imageUrl,
              width: 64, height: 64),
          const SizedBox(width: 16),
          Text(followableTopic.topic.name,
              style: Theme.of(context).textTheme.labelLarge),
          const Expanded(child: SizedBox()),
          IconButton(
              onPressed: () {
                onSaveButtonCheckStateChanged(
                    followableTopic.topic.id, !followableTopic.isFollowed);
              },
              icon: Icon(iconData)),
          const SizedBox(width: 8),
        ]),
      ),
    );
  }
}
