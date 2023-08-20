import 'package:flutter/material.dart';

abstract class NiaLocalizations {
  String get onboardingGuidanceTitle;

  String get onboardingGuidanceSubtitle;

  String get done;

  static NiaLocalizations of(BuildContext context) {
    return Localizations.of<NiaLocalizations>(context, NiaLocalizations)!;
  }
}

class EnNiaLocalizations extends NiaLocalizations {
  @override
  String get onboardingGuidanceTitle => 'What are you interested in?';

  @override
  String get onboardingGuidanceSubtitle => 'Updates from topics you follow will appear here. Follow some things to get started.';

  @override
  String get done => 'Done';
}
