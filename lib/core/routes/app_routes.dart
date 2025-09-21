import 'package:astro/core/common/screens/no_network_screen.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/featured/auth/presentation/view_models/auth_bloc.dart';
import 'package:astro/featured/auth/presentation/views/login_view.dart';
import 'package:astro/featured/auth/presentation/views/sign_up_view.dart';
import 'package:astro/featured/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String noNetwork = '/no-network';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: noNetwork,
        builder: (context, state) =>
            const NoNetworkScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: const LoginView(),
        ),
      ),
    ],
  );
}
