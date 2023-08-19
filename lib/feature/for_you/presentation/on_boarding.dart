import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feature/for_you/bloc/for_you_bloc.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';

import '../bloc/onboarding_ui_state.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ForYouBloc, ForYouUiState>(
        builder: (context, state) {
          switch (state.onboardingUiState.runtimeType) {
            case Shown:
              return _OnBoardingWidget(state: state.onboardingUiState);
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

  final OnboardingUiState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('What are you interested in?'),
        Text('Updates from topics you follow will appear here. Follow some things to get started.'),
        const Placeholder(),
      ],
    );
  }
}