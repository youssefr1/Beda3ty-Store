import 'package:astro/core/di/injection_container.dart';
import 'package:astro/featured/customer/cubit/cart_cubit.dart';
import 'package:astro/featured/customer/cubit/category_products_cubit.dart';
import 'package:astro/featured/customer/cubit/customer_home_cubit.dart';
import 'package:astro/featured/customer/data/data_source/customer_data_source.dart';
import 'package:astro/featured/customer/data/repo/customer_repo.dart';

import 'package:astro/featured/customer/cubit/notification_cubit.dart';
import 'package:astro/featured/customer/cubit/wishlist_cubit.dart';

Future<void> initCustomerDI() async {
  sl
    ..registerFactory(() => CustomerHomeCubit(sl()))
    ..registerFactory(() => CategoryProductsCubit(sl()))
    ..registerLazySingleton(() => CartCubit())
    ..registerLazySingleton(() => WishlistCubit())
    ..registerLazySingleton(() => NotificationCubit())
    ..registerLazySingleton<CustomerRepo>(() => CustomerRepoImpl(sl()))
    ..registerLazySingleton<CustomerDataSource>(() => CustomerDataSourceImpl(sl()));
}
