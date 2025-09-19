

import 'package:astro/core/app/app_cubit/app_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  await _initalCore();
}

 Future<void> _initalCore() async{
   sl.registerFactory(AppCubit.new);
}