import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'astro_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();

  runApp(const Beda3tyStoreApp());
}
