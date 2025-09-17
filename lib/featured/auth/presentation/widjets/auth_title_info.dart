import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTitleInfo extends StatelessWidget {
  const AuthTitleInfo({required this.title, required this.description, super.key});
    final String title;
    final String description;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: Column(
        children: [
          TextApp(
            text: title,
            textAlign: TextAlign.center,
            theme: context.textStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeightHelper.bold,
              color: context.color.textColor

            ),
          ),
           SizedBox(height: 20.h,),
          TextApp(
            text: description,
            textAlign: TextAlign.center,
            theme: context.textStyle.copyWith(
              fontSize: 20.sp,
              fontWeight:  FontWeightHelper.medium,
              color: context.color.textColor
            ),
          ),
        ],
      ),
    );
  }
}
