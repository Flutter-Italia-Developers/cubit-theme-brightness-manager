import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import 'package:cubit_theme_brightness_manager/core/themes/app_theme.dart';
import 'package:cubit_theme_brightness_manager/logic/theme_dropdown/theme_dropdown_cubit.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  final Stream<ThemeDropdownState> themeDropdownStream;
  late StreamSubscription themeDropdownSubscription;

  ThemeCubit({required this.themeDropdownStream}) : super(ThemeState(themeMode: AppTheme.currentSystemThemeMode)) {
    themeDropdownSubscription = themeDropdownStream.listen((state) {
      switch (state.theme) {
        case 'Light':
          _setTheme(ThemeMode.light);
          break;
        case 'Dark':
          _setTheme(ThemeMode.dark);
          break;
        default:
          _setTheme(AppTheme.currentSystemThemeMode);
          break;
      }
    });
  }

  void updateAppTheme(Brightness currentBrightness) {
    currentBrightness == Brightness.light ? _setTheme(ThemeMode.dark) : _setTheme(ThemeMode.light);
  }

  void updateAppThemeByOSSetting() => _setTheme(AppTheme.currentSystemThemeMode);

  void _setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }

  @override
  Future<void> close() {
    themeDropdownSubscription.cancel();
    return super.close();
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) => ThemeState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(ThemeState state) => state.toMap();
}
