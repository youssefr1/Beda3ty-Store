import 'package:astro/core/app/app_cubit/app_cubit.dart';
import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/custom_linear_button.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/app_localizations.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkAndLangBar extends StatelessWidget {
  const DarkAndLangBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // dark mode buttom
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInRight(
              duration: 500,
              child: CustomLinearButton(
                width: 50,
                onPressed: cubit.changeAppThemeMode,
                child: Icon(
                  cubit.isDark
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        // language buttom
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return CustomFadeInLeft(
              duration: 500,
              child: CustomLinearButton(
                width: 100,
                onPressed: (){
                  if(AppLocalizations.of(context)!.isEnLocale){
                     cubit.toArabic();
                  }else{
                    cubit.toEnglish();
                  }
                },
                child:  TextApp(
                  text: context.translate(
                      LangKeys.language),
                  theme: context.textStyle.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeightHelper.bold
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
