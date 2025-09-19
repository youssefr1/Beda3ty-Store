

import 'package:astro/core/app/app_cubit/app_cubit.dart';
import 'package:astro/core/services/graphql/api_service.dart';
import 'package:astro/core/services/graphql/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  await _initalCore();
}

 Future<void> _initalCore() async{
  final  dio =DioFactory.getDio() ;
   sl..registerFactory(AppCubit.new)
   ..registerLazySingleton(()=>ApiService(dio));
}