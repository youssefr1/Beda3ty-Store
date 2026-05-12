import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:astro/featured/admin/dashboard/presentation/veiws/widjets/dashboard_container.dart';
import 'package:astro/featured/admin/dashboard/presentation/view model/category/categories_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view model/products/products_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view model/users/users_number_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardBodyView extends StatelessWidget {
  const DashboardBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 30.w,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ProductsNumberBloc>(
            context,
          ).add(const GetProductsNumber());
          BlocProvider.of<CategoriesNumberBloc>(
            context,
          ).add(const GetCategoryNumber());
          BlocProvider.of<UsersNumberBloc>(
            context,
          ).add(const GetUsersNumber());
        },
        child: ListView(
          children: [
            // products
            BlocBuilder<ProductsNumberBloc, ProductsNumberState>(
              builder: (context, state) {
                if (state is ProductsNumberSuccess) {
                  return CustomFadeInRight(
                    duration: 400,
                    child: DashboardContainer(
                      title: 'Products',
                      number: state.productNumber,
                      image: AppImages.productsDrawer,
                      isLoaidng: false,
                    ),
                  );
                } else if (state is ProductsNumberLoading) {
                  return const CustomFadeInRight(
                    duration: 400,
                    child: DashboardContainer(
                      title: 'Products',
                      number: '0',
                      image: AppImages.productsDrawer,
                      isLoaidng: true,
                    ),
                  );
                } else if (state is ProductsNumberFailure) {
                  return TextApp(
                    text: state.message,
                    theme: context.textStyle.copyWith(
                      color: Colors.red,
                      fontSize: 16.sp,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            // Categories
            BlocBuilder<CategoriesNumberBloc, CategoriesNumberState>(
              builder: (context, state) {
                if (state is CategoriesNumberSuccess) {
                  return CustomFadeInRight(
                    duration: 400,
                    child: DashboardContainer(
                      title: 'Categories',
                      number: state.categoryNumber,
                      image: AppImages.categoriesDrawer,
                      isLoaidng: false,
                    ),
                  );
                } else if (state is CategoriesNumberLoading) {
                  return const CustomFadeInRight(
                    duration: 400,
                    child: DashboardContainer(
                      title: 'Categories',
                      number: '0',
                      image: AppImages.categoriesDrawer,
                      isLoaidng: true,
                    ),
                  );
                } else if (state is CategoriesNumberFailure) {
                  return TextApp(
                    text: state.message,
                    theme: context.textStyle.copyWith(
                      color: Colors.red,
                      fontSize: 16.sp,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            // Users
            BlocBuilder<UsersNumberBloc, UsersNumberState>(
              builder: (context, state) {
                if (state is UsersNumberSuccess) {
                  return CustomFadeInRight(
                    duration: 400,
                    child: DashboardContainer(
                      title: 'Users',
                      number: state.userNumber,
                      image: AppImages.usersDrawer,
                      isLoaidng: false,
                    ),
                  );
                } else if (state is UsersNumberLoading) {
                  return const CustomFadeInRight(
                    duration: 400,
                    child: DashboardContainer(
                      title: 'Users',
                      number: '0',
                      image: AppImages.usersDrawer,
                      isLoaidng: true,
                    ),
                  );
                } else if (state is UsersNumberFailure) {
                  return TextApp(
                    text: state.message,
                    theme: context.textStyle.copyWith(
                      color: Colors.red,
                      fontSize: 16.sp,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
