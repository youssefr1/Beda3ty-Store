import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:astro/featured/splash/presentation/views/splash_view.dart';
import 'package:astro/test_screen1.dart';
import 'package:astro/test_screen2.dart';
import 'package:astro/core/common/screens/no_network_screen.dart';

class AppRouter {
  // ✅ تعريف المسارات كمتغيرات
  static const String splash = '/splash';
  static const String screen1 = '/screen1';
  static const String screen2 = '/screen2';
  static const String noNetwork = '/no-network';

  // ✅ تعريف GoRouter
  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: screen1,
        builder: (context, state) => const TestScreen1(),
      ),
      GoRoute(
        path: screen2,
        builder: (context, state) => const TestScreen2(),
      ),
      GoRoute(
        path: noNetwork,
        builder: (context, state) => const NoNetworkScreen(),
      ),
    ],
  );
}
