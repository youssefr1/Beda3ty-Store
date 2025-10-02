

import 'package:astro/core/app/app_cubit/app_cubit.dart';
import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/app/upload_image/data_source/upload_image_dataSource.dart';
import 'package:astro/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:astro/core/services/graphql/api_service.dart';
import 'package:astro/core/services/graphql/dio_factory.dart';
import 'package:astro/featured/admin/dashboard/data/data%20source/admin_data_source.dart';
import 'package:astro/featured/admin/dashboard/data/repo/dashboard_repo.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/category/categories_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/products/products_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/users/users_number_bloc.dart';
import 'package:astro/featured/auth/data/data_source/auth_data_source.dart';
import 'package:astro/featured/auth/data/repos/auth_repos.dart';
import 'package:astro/featured/auth/presentation/view_models/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  await _initalCore();
  await _initAuth();
  await _dashboard();
}

 Future<void> _initalCore() async{
  final  dio =DioFactory.getDio() ;
  final navigatorKey = GlobalKey<NavigatorState>();
   sl..registerFactory(AppCubit.new)
     ..registerLazySingleton(()=>ApiService(dio))
     ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
     ..registerFactory(()=>UploadImageCubit(sl()))
     ..registerLazySingleton(()=>UploadImageRepo(sl()))
     ..registerLazySingleton(()=>UploadImageDataSource(sl()))
  ;

}
Future<void> _initAuth() async{
  sl..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(()=>AuthRepos(sl()))
    ..registerLazySingleton(()=>AuthDataSource(sl()));

}
Future<void> _dashboard() async{
  sl..registerFactory(() => UsersNumberBloc(sl()))
      ..registerFactory(() => CategoriesNumberBloc(sl()))
      ..registerFactory(() => ProductsNumberBloc(sl()))
      ..registerLazySingleton(() => DashboardRepo(sl()))
      ..registerLazySingleton(() => DashBoardDataSource(sl()));


}


