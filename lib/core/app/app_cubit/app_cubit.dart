import 'dart:ui';
import 'package:astro/core/services/shared_pref/pref_keys.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:bloc/bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppInitial());
  bool isDark = true;
  String currentLanguage = 'en';

  // Theme mode
  Future<void> changeAppThemeMode({
    bool? sharedMode,
  }) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(ThemeChangeModeState(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref()
          .setBoolean(PrefKeys.themeMode, isDark)
          .then(
            (value) => emit(
              ThemeChangeModeState(isDark: isDark),
            ),
          );
    }
  }

  //language mode
  void getSavedLanguage() {
    final result =
        SharedPref().containPreference(
          PrefKeys.languageMode,
        )
        ? SharedPref().getString(PrefKeys.languageMode)
        : 'en';
    currentLanguage = result!;
    emit(LanguageChangeModeState(locale: Locale(currentLanguage)));
  }

  Future<void> _changeLang(String langCode) async {
    await SharedPref().setString(PrefKeys.languageMode, langCode);
    currentLanguage = langCode;
    emit(LanguageChangeModeState(locale: Locale(currentLanguage)));
  }

  void toArabic() => _changeLang('ar');
  void toEnglish() => _changeLang('en');
}
