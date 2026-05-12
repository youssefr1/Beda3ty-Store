import 'package:astro/core/app/app_cubit/app_cubit.dart';
import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/app/upload_image/data_source/upload_image_dataSource.dart';
import 'package:astro/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:astro/core/services/graphql/dio_factory.dart';
import 'package:astro/featured/admin/add_categories/data/create%20categories/data%20source/create_categories_data_source.dart';
import 'package:astro/featured/admin/add_categories/data/create%20categories/repo/create_categories_repo.dart';
import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/data%20source/get_all_category_dataSource.dart';
import 'package:astro/featured/admin/add_categories/data/get%20all%20categories/repo/get_all_category_repo.dart';
import 'package:astro/featured/admin/add_categories/data/update%20categories/data%20source/update_categoies_data_source.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/create%20categories/create_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/delete%20category/delete_category_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/getall%20categories/get_all_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/update%20categories/update_categories_bloc.dart';
import 'package:astro/featured/admin/add_products/data/get%20all%20products/data%20source/product_datasource.dart';
import 'package:astro/featured/admin/add_products/data/get%20all%20products/repo/product_repo.dart';
import 'package:astro/featured/admin/add_products/presentation/view%20modell/getall%20product/get_all_product_cubit.dart';
import 'package:astro/featured/admin/dashboard/data/data%20source/admin_data_source.dart';
import 'package:astro/featured/admin/dashboard/data/repo/dashboard_repo.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/category/categories_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/products/products_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/users/users_number_bloc.dart';
import 'package:astro/featured/auth/data/data_source/auth_data_source.dart';
import 'package:astro/featured/auth/data/repos/auth_repos.dart';
import 'package:astro/featured/auth/presentation/view_models/auth_bloc.dart';
import 'package:astro/featured/customer/di/customer_di.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:astro/featured/admin/users/data/data_source/users_data_source.dart';
import 'package:astro/featured/admin/users/data/repo/users_repo.dart';
import 'package:astro/featured/admin/users/presentation/cubit/users_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  await _initalCore();
  await _initAuth();
  await _dashboard();
  await _Categories();
  await _Products();
  await _initUsers();
  await initCustomerDI();
}

/// CORE SERVICES
Future<void> _initalCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();

  sl
    ..registerFactory(AppCubit.new)
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerLazySingleton<Dio>(
      DioFactory.getDio,
    ) // Registering Dio globally for easier access
    // 🧠 Upload Image
    ..registerFactory(() => UploadImageCubit(sl()))
    ..registerLazySingleton(() => UploadImageRepo(sl()))
    ..registerLazySingleton(() => UploadImageDataSource(sl()));
}

/// AUTH
Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthRepos(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()));
}

/// DASHBOARD
Future<void> _dashboard() async {
  sl
    ..registerFactory(() => UsersNumberBloc(sl()))
    ..registerFactory(() => CategoriesNumberBloc(sl()))
    ..registerFactory(() => ProductsNumberBloc(sl()))
    ..registerLazySingleton(() => DashboardRepo(sl()))
    ..registerLazySingleton(() => DashBoardDataSource(sl()));
}

/// CATEGORIES MODULE
Future<void> _Categories() async {
  sl
    // 1️⃣ Get All Categories Data Source
    ..registerLazySingleton<GetAllCategoryDataSource>(
      () => GetAllCategoryDataSourceImpl(
        dio: sl<Dio>(),
      ),
    )
    // 2️⃣ Update Category Data Source
    ..registerLazySingleton<UpdateCategoryDataSourceImpl>(
      () => UpdateCategoryDataSourceImpl(
        dio: sl<Dio>(),
      ),
    )
    // 3️⃣ Repository
    ..registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(
        dataSource: sl<GetAllCategoryDataSource>(),
        updateDataSource: sl<UpdateCategoryDataSourceImpl>(),
      ),
    )
    // 4️⃣ Get All Categories Bloc
    ..registerFactory<GetAllCategoriesBloc>(
      () => GetAllCategoriesBloc(
        repository: sl<CategoryRepository>(),
      ),
    )
    // 5️⃣ Create Category Data Source
    ..registerLazySingleton<CreateCategoriesDataSource>(
      () => CreateCategoriesDataSourceImp(
        dio: sl<Dio>(),
      ),
    )
    // 6️⃣ Create Category Repository
    ..registerLazySingleton<CreateCategoriesRepo>(
      () => CreateCategoriesRepo(
        dataSource: sl<CreateCategoriesDataSource>(),
      ),
    )
    // 7️⃣ Create Category Bloc
    ..registerFactory<CreateCategoriesBloc>(
      () => CreateCategoriesBloc(
        sl<CreateCategoriesRepo>(),
      ),
    )
    // 8️⃣ Delete Category Bloc
    ..registerFactory<DeleteCategoriesBloc>(
      () => DeleteCategoriesBloc(sl<CategoryRepository>()),
    )
    // 9️⃣ Update Category Bloc
    ..registerFactory<UpdateCategoryBloc>(
      () => UpdateCategoryBloc(sl<CategoryRepository>()),
    );
}

Future<void> _Products() async {
  sl
    // 1️⃣ Data Source
    ..registerLazySingleton<ProductDataSource>(
      () => ProductDataSource(dio: sl<Dio>()),
    )
    // 2️⃣ Repository
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepository(sl<ProductDataSource>()),
    )
    // 3️⃣ Cubit
    ..registerFactory<GetAllProductCubit>(
      () => GetAllProductCubit(sl<ProductRepository>()),
    );
}

Future<void> _initUsers() async {
  sl
    ..registerLazySingleton<UsersDataSource>(
      () => UsersDataSourceImpl(
        dio: sl<Dio>(),
      ),
    )
    ..registerLazySingleton<UsersRepo>(
      () => UsersRepoImpl(sl<UsersDataSource>()),
    )
    ..registerFactory<UsersCubit>(
      () => UsersCubit(sl<UsersRepo>()),
    );
}
