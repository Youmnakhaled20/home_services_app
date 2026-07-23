// lib/core/cubit/theme_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light());

  void toggleTheme() {
    if (state.isDarkMode) {
      emit(ThemeState.light());
    } else {
      emit(ThemeState.dark());
    }
  }

  void setDarkMode(bool isDark) {
    if (isDark) {
      emit(ThemeState.dark());
    } else {
      emit(ThemeState.light());
    }
  }

  bool get isDarkMode => state.isDarkMode;
}