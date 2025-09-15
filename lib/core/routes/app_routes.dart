import 'package:astro/core/common/screens/under_build_screen.dart';
import 'package:astro/core/routes/base_routes.dart';
import 'package:astro/featured/splash/presentation/views/splash_view.dart';
import 'package:astro/test_screen1.dart';
import 'package:astro/test_screen2.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String testScreen1 = '/testScreen1';
  static const String testScreen2 = '/testScreen2';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return BaseRoute(page: const SplashView());
      case testScreen1:
        return BaseRoute(page: const TestScreen1());
      case testScreen2:
        return BaseRoute(page: const TestScreen2());
      default:
        return  BaseRoute(page: const SplashView());
    }
  }
}

