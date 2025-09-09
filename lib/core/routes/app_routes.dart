import 'package:astro/core/common/screens/under_build_screen.dart';
import 'package:astro/core/routes/base_routes.dart';
import 'package:astro/featured/splash/presentation/views/splash_view.dart';
import 'package:astro/test_screen1.dart';
import 'package:astro/test_screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static const String testScreen1 = 'testScreen1';
  static const String testScreen2 = 'testScreen2';
  static const String splashScreen = 'splashScreen';

  static Route<void> onGenerateRoute(RouteSettings settings){
    switch(settings.name) {
      case testScreen1:
        return BaseRoute(page: TestScreen1());
      case testScreen2:
        return BaseRoute(page: TestScreen2());
        case splashScreen:
        return BaseRoute(page: SplashView());


      default:
        return BaseRoute(
            page: const PageUnderBuildScreen());
    }
  }
}