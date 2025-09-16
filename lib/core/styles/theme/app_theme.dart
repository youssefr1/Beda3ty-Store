import 'package:astro/core/styles/theme/assets_extension.dart';
import 'package:astro/core/styles/theme/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/core/styles/colors/colors_light.dart';

ThemeData themeDark() {
  return ThemeData(
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark,MyAssets.dark],
    scaffoldBackgroundColor: ColorsDark.mainColor, // 👈 خلفية كل الشاشات
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsDark.mainColor,
    ),
  );
}

ThemeData themeLight() {
  return ThemeData(
      extensions: const <ThemeExtension<dynamic>>[MyColors.light,MyAssets.light],
      scaffoldBackgroundColor: ColorsLight.mainColor, // 👈 خلفية كل الشاشات
      colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsLight.mainColor,
          ));
}
