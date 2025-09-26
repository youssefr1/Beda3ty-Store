

import 'package:astro/core/app/app_cubit/app_cubit.dart';
import 'package:astro/core/services/graphql/api_service.dart';
import 'package:astro/core/services/graphql/dio_factory.dart';
import 'package:astro/featured/auth/data/data_source/auth_data_source.dart';
import 'package:astro/featured/auth/data/repos/auth_repos.dart';
import 'package:astro/featured/auth/presentation/view_models/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  await _initalCore();
  await _initAuth();
}

 Future<void> _initalCore() async{
  final  dio =DioFactory.getDio() ;
  final navigatorKey = GlobalKey<NavigatorState>();
   sl..registerFactory(AppCubit.new)
     ..registerLazySingleton(()=>ApiService(dio))
     ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);

}
Future<void> _initAuth() async{
  sl..registerFactory(() => AuthBloc(sl()))
  ..registerLazySingleton(()=>AuthRepos(sl()))
   ..registerLazySingleton(()=>AuthDataSource(sl()));

}