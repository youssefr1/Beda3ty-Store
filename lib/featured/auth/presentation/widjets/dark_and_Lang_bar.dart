import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/custom_linear_button.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';

class DarkAndLangBar extends StatelessWidget {
  const DarkAndLangBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // dark mode buttom
        CustomFadeInRight(
          duration: 500,
          child: CustomLinearButton(
            width: 50,
            onPressed: () {},
            child: const Icon(
              Icons.light_mode_rounded,
              color: Colors.white,
            ),
          ),
        ),
        // language buttom
        CustomFadeInLeft(
          duration: 500,
          child: CustomLinearButton(
            width: 100,
            onPressed: () {},
            child: TextApp(
              text: context.translate(LangKeys.language),
              theme: context.textStyle.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeightHelper.bold
              ),
            ),
          ),
        ),
      ],
    );
  }
}
