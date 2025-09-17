import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/custom_linear_button.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 500,
      child: CustomLinearButton(
        width: MediaQuery.of(context).size.width,
        onPressed: (){},
        child: TextApp(
          text: context.translate(LangKeys.login),
          theme: context.textStyle.copyWith(
            fontSize: 22.sp,
            fontWeight: FontWeightHelper.medium,

          )
          ,
        ),
      ),
    );
  }
}
