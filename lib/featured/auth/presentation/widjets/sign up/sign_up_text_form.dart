import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/custom_text_field.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/core/utils/app_regex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTextForm extends StatefulWidget {
  const SignUpTextForm({super.key});

  @override
  State<SignUpTextForm> createState() =>
      _SignUpTextFormState();
}

class _SignUpTextFormState extends State<SignUpTextForm> {
  bool isShowPassword = true;

  // controllers ثابتة
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  @override
  void dispose() {
    // مهم جدًا تنظفهم
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //email
          CustomFadeInLeft(
            duration: 600,
            child: CustomTextField(
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 4) {
                  return context.translate(
                    LangKeys.validName,
                  );
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              hintText: context.translate(
                LangKeys.fullName,
              ),
              hintStyle: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
              controller: nameController,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
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
                      ? Icons
                            .visibility_rounded // لما الباسورد مخفي   Icons.visibility_rounded
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
