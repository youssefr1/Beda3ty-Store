import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';

class NoScreenScreen extends StatelessWidget {
  const NoScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_empty_rounded,size: 150,color: context.color.textColor),
            SizedBox(height: 15,),
            TextApp(
              text: 'No data ',
              theme: context.textStyle.copyWith(
                fontSize: 22,
                color: context.color.textColor,
                fontWeight: FontWeightHelper.bold,
                fontFamily: FontFamilyHelper.poppinsEnglish,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
