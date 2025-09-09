import 'package:astro/core/app/connectivily_control.dart';
import 'package:astro/core/common/screens/no_network_screen.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Beda3tyStoreApp extends StatelessWidget {
  const Beda3tyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable:
      ConnectivityControler.instance.isConected,
      builder: (context, isConnected, _) {
        if (isConnected) {
          return ScreenUtilInit(
            minTextAdapt: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple,
                ),
              ),
              home: Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Beda3ty',

                  ),
                ),
                body: const Center(
                  child: Column(
                    children: [
                    //old
                    Text('test font',
                    style: TextStyle(fontSize: 24,),),
                  Text('تجربه',
                    style: TextStyle(fontSize: 24),),

                  //new
                  Text('test font', style: TextStyle(
                      fontSize: 24,

                      fontFamily: FontFamilyHelper
                          .poppinsEnglish),),
                  Text('تجربه', style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeightHelper.medium,
                      fontFamily: FontFamilyHelper
                          .cairoArabic)),
                ],
              ),
            ),
          ),
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
