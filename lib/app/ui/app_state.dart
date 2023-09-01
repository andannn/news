import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/core/data/repository/user_data_repository.dart';

class AppState extends ChangeNotifier {
  AppState(this.userDataRepository) {
    _darkThemeConfigSub = userDataRepository.getDarkThemeConfigStream().listen((theme) {
      _themeMode = _fromString(theme);
      notifyListeners();
    });
  }

  final UserDataRepository userDataRepository;

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  StreamSubscription<String>? _darkThemeConfigSub;

  @override
  void dispose() {
    super.dispose();

    _darkThemeConfigSub?.cancel();
  }
}

ThemeMode _fromString(String value) {
  return ThemeMode.values.firstWhere((theme) => theme.toString() == value,
      orElse: () => ThemeMode.system);
}
