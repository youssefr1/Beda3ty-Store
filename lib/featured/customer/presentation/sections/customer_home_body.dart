import 'package:astro/featured/customer/cubit/customer_home_cubit.dart';
import 'package:astro/featured/customer/cubit/customer_home_state.dart';
import 'package:astro/featured/customer/presentation/widgets/home/home_banner.dart';
import 'package:astro/featured/customer/presentation/widgets/home/home_categories.dart';
import 'package:astro/featured/customer/presentation/widgets/home/home_featured_products.dart';
import 'package:astro/featured/customer/presentation/widgets/home/home_header.dart';
import 'package:astro/featured/customer/presentation/widgets/home/home_search_bar.dart';
import 'package:astro/featured/customer/presentation/widgets/home/home_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerHomeBody extends StatelessWidget {
  const CustomerHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<CustomerHomeCubit>().getHomeData(),
      color: const Color(0xFF6C63FF),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  const HomeHeader(),
                  SizedBox(height: 25.h),
                  const HomeSearchBar(),
                  SizedBox(height: 25.h),

                  BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
                    builder: (context, state) {
                      if (state is CustomerHomeLoading) {
                        return Column(
                          children: [
                            const CategorySkeleton(),
                            SizedBox(height: 30.h),
                            const ProductSkeleton(),
                          ],
                        );
                      }

                      if (state is CustomerHomeError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 40,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                state.message,
                                style: const TextStyle(color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () => context
                                    .read<CustomerHomeCubit>()
                                    .getHomeData(),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      }

                      if (state is CustomerHomeSuccess) {
                        return Column(
                          children: [
                            HomeCategories(categories: state.categories),
                            SizedBox(height: 30.h),
                            HomeFeaturedProducts(products: state.products),
                          ],
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
