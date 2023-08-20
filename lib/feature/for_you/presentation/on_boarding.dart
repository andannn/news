import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app/local/nia_localizations.dart';
import 'package:news/core/data/model/followable_topic.dart';
import 'package:news/feature/for_you/bloc/for_you_bloc.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';

import '../bloc/onboarding_ui_state.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ForYouBloc, ForYouUiState>(
        builder: (context, state) {
          switch (state.onboardingUiState.runtimeType) {
            case Shown:
              return _OnBoardingWidget(
                  topics: (state.onboardingUiState as Shown).topics);
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
  const _OnBoardingWidget({super.key, required this.topics});

  final List<FollowableTopic> topics;

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
        SizedBox(height: 200, child: _TopicSelection(topics: topics)),
        const SizedBox(height: 18),
        // Done button.
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.onBackground,
              ),
              child: Text(NiaLocalizations.of(context).done)),
        )
      ],
    );
  }
}

class _TopicSelection extends StatelessWidget {
  const _TopicSelection({super.key, required this.topics});

  final List<FollowableTopic> topics;

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
                    mainAxisExtent: 250,
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
            Icon(Icons.confirmation_num_sharp),
            SizedBox(width: 8),
            Expanded(
                child: Text(
              followableTopic.topic.name,
              style: Theme.of(context).textTheme.titleSmall,
            )),
            IconButton(onPressed: null, icon: Icon(Icons.confirmation_num_sharp))
          ],
        ),
      ),
    );
  }
}
