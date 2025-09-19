import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/custom_text_field.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/core/styles/theme/color_extension.dart';
import 'package:astro/core/utils/app_regex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() =>
      _LoginTextFormState();
}

class _LoginTextFormState extends State<LoginTextForm> {
  @override
  bool isShowPassword = true;

  // controllers ثابتة
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();

  @override
  void dispose() {
    // مهم جدًا تنظفهم
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //email
          CustomFadeInRight(
            duration: 600,
            child: CustomTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: context.translate(LangKeys.email),
              hintStyle: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
              controller: emailController,
              validator: (value) {
                if (AppRegex.isEmailValid('value')) {
                  return context.translate(
                    LangKeys.validEmail,
                  );
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomFadeInLeft(
            duration: 600,
            child: CustomTextField(
              obscureText: isShowPassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: Icon(
                  isShowPassword
                      ? Icons.visibility_rounded // لما الباسورد مخفي   Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  // لما الباسورد ظاهر
                  color: isShowPassword
                      ? context.color.textColor
                      : context.color.textColor, // هنا اللون
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              hintText: context.translate(
                LangKeys.password,
              ),
              hintStyle: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
              controller: passwordController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 8) {
                  return context.translate(
                    LangKeys.validPasswrod,
                  );
                } else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
