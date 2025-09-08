import 'package:astro/core/app/connectivily_control.dart';
import 'package:astro/core/common/screens/no_network_screen.dart';
import 'package:flutter/material.dart';

class Beda3tyStoreApp extends StatelessWidget {
  const Beda3tyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ConnectivityControler.instance.isConected,
      builder: (context, isConnected, _) {
        if (isConnected) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
              ),
            ),
            home: Scaffold(
              appBar: AppBar(title: const Text('Beda3ty')),
            ),
          );
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NoNetworkScreen(),
          );
        }
      },
    );
  }
}
