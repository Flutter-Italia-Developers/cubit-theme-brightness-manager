part of 'theme_dropdown_cubit.dart';

@immutable
class ThemeDropdownState {
  final String theme;

  ThemeDropdownState({required this.theme});

  Map<String, dynamic> toMap() => {'theme': theme};

  factory ThemeDropdownState.fromMap(Map<String, dynamic> map) => ThemeDropdownState(theme: map['theme']);

  String toJson() => json.encode(toMap());

  factory ThemeDropdownState.fromJson(String source) => ThemeDropdownState.fromMap(json.decode(source));
}
