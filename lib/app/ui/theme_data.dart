import 'package:flutter/material.dart';
import 'package:news/app/ui/colors.dart';

final lightThemeData = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: purple40,
      onPrimary: Colors.white,
      secondary: orange40,
      onSecondary: Colors.white,
      error: red40,
      onError: Colors.white,
      background: orange90,
      onBackground: darkPurpleGray10,
      surface: darkPurpleGray99,
      onSurface: darkPurpleGray10),
  useMaterial3: true,
  fontFamily: 'Roboto',
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(shape: const StadiumBorder())),
);