import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.noNetwork),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              'No Network Please Open Internet',
              style: TextStyle(
                fontSize: 20,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
