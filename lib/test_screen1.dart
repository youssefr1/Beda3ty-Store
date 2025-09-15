import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestScreen1 extends StatelessWidget {
  const TestScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Test Screen 1'),

      ),
      body: Column(
        children: [
          Center(
            child: TextButton(onPressed: () {
              context.pushRoute(AppRouter.screen2);
            }, child: Text(' to second screen',style: TextStyle(color:context.theme.mainColor,fontSize: 30),),
              // 👈 جاي من الثيم
            ),
          ),
          Image.asset(context.image.testImage!)
        ],
      ),
    );
  }
}
