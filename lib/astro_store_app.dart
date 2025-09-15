import 'package:astro/core/app/connectivily_control.dart';
import 'package:astro/core/common/screens/no_network_screen.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class Beda3tyStoreApp extends StatelessWidget {
  const Beda3tyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.splashScreen,
      builder: (context, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: ConnectivityControler.instance.isConected,
          builder: (context, isConnected, _) {
            if (isConnected) {
              return child!;
            } else {
              return const NoNetworkScreen();
            }
          },
        );
      },
    );
  }
}
