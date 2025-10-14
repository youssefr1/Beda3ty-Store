import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/common/screens/no_network_screen.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/featured/admin/add_categories/presentation/veiws/add_categories_view.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/getall%20categories/get_all_categories_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/veiws/dashboard_view.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/category/categories_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/products/products_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/users/users_number_bloc.dart';
import 'package:astro/featured/admin/home_admin/presentation/veiws/home_admin_view.dart';
import 'package:astro/featured/auth/presentation/view_models/auth_bloc.dart';
import 'package:astro/featured/auth/presentation/views/login_view.dart';
import 'package:astro/featured/auth/presentation/views/sign_up_view.dart';
import 'package:astro/featured/customer/home_customer.dart';
import 'package:astro/featured/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signUp = '/sign-up';
  static const String noNetwork = '/no-network';
  static const String homeAdmin = '/home-admin';
  static const String homeCustomer = '/home-customer';
  static const String dashboard = '/dashboard';
  static const String categories = '/categories';
  static const String products = '/products';
  static const String users = '/users';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    navigatorKey: sl<GlobalKey<NavigatorState>>(),
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeCustomer,
        builder: (context, state) => const HomeCustomer(),
      ),
      GoRoute(
        path: homeAdmin,
        builder: (context, state) => const HomeAdmin(),),
      GoRoute(
        path: signUp,
        builder: (context, state) =>
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      sl<UploadImageCubit>(),
                ),
                BlocProvider(
                  create: (context) => sl<AuthBloc>(),
                ),
              ],
              child: const SignUpView(),
            ),
      ),
      GoRoute(
        path: noNetwork,
        builder: (context, state) =>
        const NoNetworkScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: const LoginView(),
            ),
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) => BlocProvider(
          create: (context) =>
          sl<GetAllCategoriesBloc>()..add(CategoryEvent()),
          child: const AddCategoriesView(),
        ),
      ),

    ],
  );
}
