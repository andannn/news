import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/feature/for_you/bloc/for_you_bloc.dart';
import 'package:news/feature/for_you/bloc/for_you_ui_state.dart';

import '../bloc/onboarding_ui_state.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ForYouBloc, ForYouUiState>(builder: (context, state) {
        switch (state.onboardingUiState.runtimeType) {
          case Shown:
            return SizedBox(height: 100, child: Placeholder());
          default:
            return const SizedBox();
        }
      });
}
