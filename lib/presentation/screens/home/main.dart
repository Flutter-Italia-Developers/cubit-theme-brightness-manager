import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit_theme_brightness_manager/logic/theme_dropdown/theme_dropdown_cubit.dart';

import 'package:cubit_theme_brightness_manager/logic/theme/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theme brightness manager')),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Theme:'),
                DropdownButton<String>(
                  value: context.select((ThemeDropdownCubit themeDropdownCubit) => themeDropdownCubit.state.theme),
                  items: [
                    ...['Light', 'Dark', 'System default'].map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    )
                  ],
                  onChanged: (String? value) => context.read<ThemeDropdownCubit>().updateTheme(value!),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<ThemeCubit>().updateAppTheme(Theme.of(context).brightness);
          context
              .read<ThemeDropdownCubit>()
              .updateTheme(Theme.of(context).brightness == Brightness.light ? 'Dark' : 'Light');
        },
        label: Row(
          children: [
            Text('Change theme'),
            SizedBox(width: 8),
            Icon(Icons.format_paint),
          ],
        ),
      ),
    );
  }
}
