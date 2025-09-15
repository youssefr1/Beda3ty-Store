import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestScreen2 extends StatelessWidget {
  const TestScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back)),
        title: const Text('test screen2'),
      ),
    );
  }
}
