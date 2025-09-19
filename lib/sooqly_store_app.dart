import 'package:astro/core/app/app_cubit/app_cubit.dart';
import 'package:astro/core/common/screens/no_network_screen.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/language/app_localizations_setup.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/services/shared_pref/pref_keys.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:astro/core/styles/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:astro/core/app/connectivily_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SooqlyStoreApp extends StatelessWidget {
  const SooqlyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable:
      ConnectivityControler.instance.isConected,
      builder: (context, isConnected, _) {
        return BlocProvider(
          create: (context) =>
          sl<AppCubit>()
            ..changeAppThemeMode(
              sharedMode: SharedPref().getBoolean(
                PrefKeys.themeMode,
              ),
            ),
          child: ScreenUtilInit(
            designSize: const Size(375, 812),
            // غير الأبعاد حسب التصميم بتاعك (Figma)
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return BlocBuilder<AppCubit, AppState>(
                buildWhen:(previous, current) {
                  return previous != current;
                } ,
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp.router(
                    // theme section
                    theme: cubit.isDark ? themeLight(): themeDark(),
                    // language section
                    locale:  Locale(cubit.currentLanguage),
                    supportedLocales:
                    AppLocalizationsSetup.supportedLocales,
                    localizationsDelegates:
                    AppLocalizationsSetup
                        .localizationsDelegates,
                    localeResolutionCallback:
                    AppLocalizationsSetup
                        .localeResolutionCallback,
                    debugShowCheckedModeBanner: false,
                    // route section
                    routerConfig: AppRouter.router,
                    builder: (context, child) {
                      if (!isConnected) {
                        return const NoNetworkScreen();
                      }
                      return child!;
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
