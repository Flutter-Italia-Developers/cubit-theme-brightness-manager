import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:cubit_theme_brightness_manager/core/themes/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            themeMode: AppTheme.currentSystemBrightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
          ),
        );

  void updateAppTheme(Brightness currentBrightness) {
    currentBrightness == Brightness.light ? _setTheme(ThemeMode.dark) : _setTheme(ThemeMode.light);
  }

  void _setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }
}
