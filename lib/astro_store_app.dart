import 'package:astro/core/common/screens/no_network_screen.dart';
import 'package:astro/core/language/app_localizations_setup.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/styles/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:astro/core/app/connectivily_control.dart';
import 'package:go_router/go_router.dart';

class Beda3tyStoreApp extends StatelessWidget {
  const Beda3tyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityControler.instance.isConected,
      builder: (context, isConnected, _) {
        return MaterialApp.router(
          //theme section
          theme: themeLight(),
          // language section
          locale: Locale('ar') ,
          supportedLocales: AppLocalizationsSetup.supportedLocales,
          localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
          localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
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
  }
}
