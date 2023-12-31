import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/app/local/nia_localizations.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/feature/for_you/bloc/for_you_bloc.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';

import '../../../core/design_system/common_widget/nia_toggle_button.dart';
import '../bloc/onboarding_ui_state.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ForYouBloc, ForYouUiState>(
        builder: (context, state) {
          switch (state.onboardingUiState.runtimeType) {
            case OnboardingShown:
              return _OnBoardingWidget(
                  state: (state.onboardingUiState as OnboardingShown));
            default:
              return const SizedBox();
          }
        },
        buildWhen: (previous, current) {
          return previous.onboardingUiState != current.onboardingUiState;
        },
      );
}

class _OnBoardingWidget extends StatelessWidget {
  const _OnBoardingWidget({super.key, required this.state});

  final OnboardingShown state;

  List<FollowableTopic> get topics => state.topics;

  bool get enabled => state.topics.any((topic) => topic.isFollowed);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 36),
        // Title.
        Text(
          NiaLocalizations.of(context).onboardingGuidanceTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 18),
        // Sub title.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Text(
            NiaLocalizations.of(context).onboardingGuidanceSubtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 18),
        // Topic selection.
        SizedBox(
            height: 200,
            child: _TopicSelection(
              topics: topics,
              onTopicCheckedStateChanged: (String topicId, bool isChecked) {
                // notify event to ForYouBloc.
                context
                    .read<ForYouBloc>()
                    .add(OnUpdateTopicSelection(topicId, isChecked));
              },
            )),
        const SizedBox(height: 18),
        // Done button.
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: _buildDoneButton(context, enabled))
      ],
    );
  }

  Widget _buildDoneButton(BuildContext context, bool enabled) {
    VoidCallback? listener;
    if (enabled) {
      listener = () {
        context.read<ForYouBloc>().add(const OnDismissOnboarding());
      };
    } else {
      listener = null;
    }

    final colorScheme = Theme.of(context).colorScheme;
    return TextButton(
        onPressed: listener,
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.onBackground,
          disabledBackgroundColor: colorScheme.onBackground.withAlpha(120),
          disabledForegroundColor: colorScheme.onPrimary.withAlpha(120),
        ),
        child: Text(NiaLocalizations.of(context).done));
  }
}

class _TopicSelection extends StatelessWidget {
  const _TopicSelection(
      {super.key,
      required this.topics,
      required this.onTopicCheckedStateChanged});

  final List<FollowableTopic> topics;
  final Function(String topicId, bool isChecked) onTopicCheckedStateChanged;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(_createTopicItemWidget,
                    childCount: topics.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 280,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    crossAxisCount: 3))),
      ],
    );
  }

  Widget _createTopicItemWidget(BuildContext context, int index) {
    final followableTopic = topics[index];
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.surface),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          children: [
            SvgPicture.network(followableTopic.topic.imageUrl,
                width: 48, height: 48),
            const SizedBox(width: 8),
            Expanded(
                child: Text(
              followableTopic.topic.name,
              style: Theme.of(context).textTheme.titleSmall,
            )),
            NiaToggleButton(
                isChecked: followableTopic.isFollowed,
                uncheckedIconData: Icons.add,
                checkedIconData: Icons.check_circle,
                onCheckChanged: (bool isChecked) {
                  onTopicCheckedStateChanged(
                      followableTopic.topic.id, isChecked);
                })
          ],
        ),
      ),
    );
  }
}
