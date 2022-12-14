import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  return ThemeData(
      primaryColor: const Color(0xFFF44336),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF44336),
      backgroundColor: const Color(0xFFF44336));
}

ThemeData buildDarkTheme() {
  return ThemeData(brightness: Brightness.dark);
}
