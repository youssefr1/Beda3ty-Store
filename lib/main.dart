import 'package:astro/core/app/bloc_observer.dart';
import 'package:astro/core/app/connectivily_control.dart';
import 'package:astro/core/app/env.variable.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:astro/featured/splash/presentation/views/splash_view.dart';
import 'package:astro/sooqly_store_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  Bloc.observer = MyBlocObserver();
  await SharedPref().instantiatePreferences();
  await setupInjection();
  await Firebase.initializeApp();
  await ConnectivityControler.instance.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then ((_){
    runApp(const SooqlyStoreApp());
  });

}
