import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/featured/splash/presentation/views/widjets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    // Immersive status bar for the splash
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return const Scaffold(
      backgroundColor: Color(0xFF242C3B),
      body: SplashViewBody(),
    );
  }
}
