import 'package:flutter/material.dart';

abstract class NiaLocalizations {
  String get onboardingGuidanceTitle;

  String get onboardingGuidanceSubtitle;

  String get done;

  String get bookmarksEmptyError;

  String get bookmarksEmptyDescription;

  String get undoLabel;

  String get bookmarkRemoved;

  String get emptyHeader;

  String get settingsTitle;

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

  @override
  String get bookmarksEmptyError => 'No saved updates';

  @override
  String get bookmarksEmptyDescription => 'Updates you save will be stored here\nto read later';

  @override
  String get undoLabel => 'Undo';

  @override
  String get bookmarkRemoved => 'Bookmark removed';

  @override
  String get emptyHeader => 'No available data';

  @override
  String get settingsTitle => 'Setting';
}
