import 'package:bloc/bloc.dart';
import 'package:bloc_test_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            themeMode: AppTheme.currentSystemBrightness == Brightness.light
                ? ThemeMode.dark
                : ThemeMode.light,
          ),
        );

  void updateAppTheme(Brightness currentBrightness) {
    currentBrightness == Brightness.light
        ? this._setTheme(ThemeMode.dark)
        : this._setTheme(ThemeMode.light);
  }

  void _setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }
}
