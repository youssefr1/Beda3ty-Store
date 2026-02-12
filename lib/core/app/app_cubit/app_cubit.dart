import 'dart:ui';

import 'package:astro/core/services/shared_pref/pref_keys.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_state.dart';

part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  bool isDark = true;
String currentLanguage = 'en';

  // Theme mode
  Future<void> changeAppThemeMode({
    bool? sharedMode,
  }) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref()
          .setBoolean(PrefKeys.themeMode, isDark)
          .then(
            (value) => emit(
              AppState.themeChangeMode(isDark: isDark),
            ),
          );
    }
  }

  //language mode
  void getSavedLanguage()  {
    final result =
        SharedPref().containPreference(PrefKeys.languageMode,)
            ?
        SharedPref().getString(PrefKeys.languageMode)
            : 'en';
    currentLanguage =result!;
    emit(AppState.languageChangeMode(locale: Locale(currentLanguage)));
  }
Future<void> _changeLang (String langCode)async{
    await SharedPref().setString(PrefKeys.languageMode, langCode);
    currentLanguage = langCode;
    emit(AppState.languageChangeMode(locale: Locale(currentLanguage)));
}
  void toArabic()=>_changeLang('ar');
  void toEnglish()=>_changeLang('en');
}
