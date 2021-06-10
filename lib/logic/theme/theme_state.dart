part of 'theme_cubit.dart';

@immutable
class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});

  Map<String, dynamic> toMap() => {'themeMode': themeMode == ThemeMode.light ? 'light' : 'dark'};

  factory ThemeState.fromMap(Map<String, dynamic> map) =>
      ThemeState(themeMode: map['themeMode'] == 'light' ? ThemeMode.light : ThemeMode.dark);

  String toJson() => json.encode(toMap());

  factory ThemeState.fromJson(String source) => ThemeState.fromMap(json.decode(source));
}
