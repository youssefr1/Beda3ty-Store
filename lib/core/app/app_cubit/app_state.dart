part of 'app_cubit.dart';

abstract class AppState {
  const AppState();
}

class AppInitial extends AppState {
  const AppInitial();
}

class ThemeChangeModeState extends AppState {
  final bool isDark;
  const ThemeChangeModeState({required this.isDark});
}

class LanguageChangeModeState extends AppState {
  final Locale locale;
  const LanguageChangeModeState({required this.locale});
}
