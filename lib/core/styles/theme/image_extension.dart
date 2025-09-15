import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/core/styles/colors/colors_light.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';

class MyImages extends ThemeExtension<MyImages>{


  const MyImages({required this.testImage});

  static const MyImages light = MyImages(testImage: AppImages.lightTest);
  static const MyImages dark = MyImages(testImage: AppImages.darkTest);
  final String? testImage;
  @override
  ThemeExtension<MyImages> copyWith({String? TestImage}) {
    return MyImages(testImage: TestImage);
  }

  @override
  ThemeExtension<MyImages> lerp(covariant ThemeExtension<MyImages>? other, double t) {
    if (other is! MyImages) {
      return this;
    }
    return MyImages(testImage: testImage);
  }

}