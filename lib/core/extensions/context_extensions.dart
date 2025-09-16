import 'package:astro/core/language/app_localizations.dart';
import 'package:astro/core/styles/theme/assets_extension.dart';
import 'package:astro/core/styles/theme/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouterExtensions on BuildContext {
  /// ✅ يضيف صفحة جديدة فوق الحالية (زي push في Navigator)
  /// - ينفع ترجع للصفحة اللي قبلها
  void pushRoute(String route) {
    push(route);
  }

  /// ✅ يبدل الصفحة الحالية باللي بعدها (زي pushReplacement في Navigator)
  /// - ماينفعش ترجع لللي قبلها
  void goRoute(String route) {
    go(route);
  }

  /// ✅ يرجع صفحة واحدة للخلف (زي Navigator.pop)
  void popRoute() {
    pop();
  }

  /// ✅ يروح لصفحة جديدة ويمسح كل اللي قبلها (زي pushAndRemoveUntil)
  /// - مثالي لو عايز تبدأ من صفحة معينة وتمنع الرجوع
  void pushAndRemoveUntilRoute(String route) {
    go(route); // go في GoRouter بيمسح اللي قبله أوتوماتيك
  }
// Images
  MyAssets get image => Theme.of(this).extension<MyAssets>()!;


  // colors
MyColors get color => Theme.of(this).extension<MyColors>()!;

// language
String translate (String langKey){
  return AppLocalizations.of(this)!.translate(langKey)!;
}

TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;


}
