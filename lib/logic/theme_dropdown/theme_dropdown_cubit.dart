import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import 'package:cubit_theme_brightness_manager/core/themes/app_theme.dart';

part 'theme_dropdown_state.dart';

class ThemeDropdownCubit extends HydratedCubit<ThemeDropdownState> {
  ThemeDropdownCubit()
      : super(ThemeDropdownState(theme: AppTheme.currentSystemThemeMode == ThemeMode.light ? 'Light' : 'Dark'));

  void updateTheme(String value) => emit(ThemeDropdownState(theme: value));

  @override
  ThemeDropdownState? fromJson(Map<String, dynamic> json) => ThemeDropdownState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(ThemeDropdownState state) => state.toMap();
}
