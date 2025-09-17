import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/featured/splash/presentation/views/widjets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xff242C3B),
          body: SplashViewBody()
      )
    ;
  }
}
