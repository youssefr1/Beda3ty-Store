import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Beda3tyStoreApp extends StatelessWidget {
  const Beda3tyStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beda3ty Store App',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(appBar: AppBar(title: Text('Beda3ty'),centerTitle: true,),),
    );
  }
}
