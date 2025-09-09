import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen1 extends StatelessWidget {
  const TestScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('test screen 1'),
      ),
      body: Center(
        child: TextButton(onPressed: (){
          context.pushNamed(AppRoutes.testScreen2);
        }, child: Text('to second screen',style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
