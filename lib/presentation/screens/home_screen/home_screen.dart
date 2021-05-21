import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cubit_theme_brightness_manager/logic/cubit/theme_cubit.dart';

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
          context.read<ThemeCubit>().updateAppTheme(Theme.of(context).brightness);
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
