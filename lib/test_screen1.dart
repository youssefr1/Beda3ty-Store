import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
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
            child: TextButton(
              onPressed: () {
                context.pushRoute(AppRouter.screen2);
              },
              child: Text(
                ' to second screen',
                style: TextStyle(
                  color: context.color.mainColor,
                  fontSize: 30,
                ),
              ),
              // 👈 جاي من الثيم
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            context.translate(LangKeys.appName),
            style: TextStyle(fontSize: 30),
          ),
          Image.asset(
            context.image.bigNavBar!,
            width: 200,
          ),
        ],
      ),
    );
  }
}
