import 'package:astro/core/app/env.variable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'astro_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);

  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then ((_){
    runApp(const Beda3tyStoreApp());
  });


}
