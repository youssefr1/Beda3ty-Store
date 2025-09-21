import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/auth/presentation/widjets/auth_title_info.dart';
import 'package:astro/featured/auth/presentation/widjets/dark_and_Lang_bar.dart';
import 'package:astro/featured/auth/presentation/widjets/login/login_button.dart';
import 'package:astro/featured/auth/presentation/widjets/login/login_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //dark mode and language
            const DarkAndLangBar(),
            SizedBox(
              height: 50.h,
            ),
            // Welcome Info
            AuthTitleInfo(
              title: context.translate(LangKeys.login),
              description: context.translate(
                LangKeys.welcome,
              ),
            ),

            SizedBox(
              height: 30.h,
            ),
            // Email TextField and Password TextField
            const LoginTextForm(),
            //
            SizedBox(
              height: 30.h,
            ),
             LoginButton(),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: (){
                context.goRoute(AppRouter.signUp);
              },
              child: CustomFadeInUp(
                duration: 600,
                child: TextApp(
                  text: context.translate(
                    LangKeys.createAccount,
                  ),
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    color: context.color.bluePinkLight,
                    fontWeight: FontWeightHelper.medium,

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
