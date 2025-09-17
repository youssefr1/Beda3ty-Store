import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/featured/auth/presentation/widjets/auth_title_info.dart';
import 'package:astro/featured/auth/presentation/widjets/dark_and_Lang_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBodyView extends StatelessWidget {
  const LoginBodyView({super.key});

  @override
  Widget build(BuildContext context) {
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


          ],
        ),
      ),
    );
  }
}
