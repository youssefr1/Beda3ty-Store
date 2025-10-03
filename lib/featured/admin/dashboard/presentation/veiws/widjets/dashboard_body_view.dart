import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:astro/featured/admin/dashboard/presentation/veiws/widjets/dashboard_container.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/category/categories_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/products/products_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/users/users_number_bloc.dart';
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
          BlocProvider.of<ProductsNumberBloc>(context)
              .add(const ProductsNumberEvent.getProductNumber());
          BlocProvider.of<CategoriesNumberBloc>(context)
              .add(const CategoriesNumberEvent.getCategoryNumber());
          BlocProvider.of<UsersNumberBloc>(context)
              .add(const UsersNumberEvent.getUserNumber());


        },
        child: ListView(
          children: [
            // products
            BlocBuilder<ProductsNumberBloc, ProductsNumberState>(
              builder: (context, state) {
                return state.when(
                  succsse: (productNumber) {
                    return DashboardContainer(
                      title: 'Products',
                      number: productNumber,
                      image: AppImages.productsDrawer,
                      isLoaidng: false,
                    );
                  },
                  loading: () {
                    return const DashboardContainer(
                      title: 'Products',
                      number: '0',
                      image: AppImages.productsDrawer,
                      isLoaidng: true,
                    );
                  },
                  failure: (error) {
                    return TextApp(
                      text: error,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
            // Categories
            BlocBuilder<CategoriesNumberBloc, CategoriesNumberState>(
              builder: (context, state) {
                return state.when(
                    succsse: (categoryNum){
                    return  DashboardContainer(
                        title: 'Categories',
                        number: categoryNum,
                        image: AppImages.categoriesDrawer,
                        isLoaidng: false,
                      );
                    },
                    loading: (){
                   return   const DashboardContainer(
                        title: 'Categories',
                        number: '0',
                        image: AppImages.categoriesDrawer,
                        isLoaidng: true,
                      );
                    },
                    failure: (error){
                      return TextApp(
                        text: error,
                        theme: context.textStyle.copyWith(
                          color: Colors.red,
                          fontSize: 16.sp,
                        ),
                      );
                    });
              },
            ),
            // Users
            BlocBuilder<UsersNumberBloc, UsersNumberState>(
      builder: (context, state) {
        return state.when(
    succsse: (usersNum){
      return DashboardContainer(
        title: 'Users',
        number: usersNum,
        image: AppImages.usersDrawer,
        isLoaidng: false,
      );
    },
    loading: (){
      return const DashboardContainer(
        title: 'Users',
        number: '0',
        image: AppImages.usersDrawer,
        isLoaidng: true,
      );
    },
    failure: (error){
      return TextApp(
        text: error,
        theme: context.textStyle.copyWith(
          color: Colors.red,
          fontSize: 16.sp,
        ),
      );
    });
      },
    ),
            //
          ],
        ),
      ),
    );
  }
}
