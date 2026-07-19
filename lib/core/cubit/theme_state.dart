import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ThemeState {
  final bool isDarkMode;
  final ThemeData themeData;

  const ThemeState({
    required this.isDarkMode,
    required this.themeData,
  });

  factory ThemeState.light() {
    return ThemeState(
      isDarkMode: false,
      themeData: AppTheme.lightTheme,
    );
  }

  factory ThemeState.dark() {
    return ThemeState(
      isDarkMode: true,
      themeData: AppTheme.darkTheme,
    );
  }
}