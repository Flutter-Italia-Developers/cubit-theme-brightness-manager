import 'package:cubit_theme_brightness_manager/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit_theme_brightness_manager/logic/theme/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var nextBrightness = Theme.of(context).brightness == Brightness.light ? Brightness.dark : Brightness.light;
          context.read<ThemeCubit>().updateAppTheme(nextBrightness);
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
