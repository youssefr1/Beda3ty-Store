import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/customer/cubit/customer_home_cubit.dart';
import 'package:astro/featured/customer/cubit/customer_home_state.dart';
import 'package:astro/featured/customer/data/model/customer_product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomerCategoriesView extends StatelessWidget {
  const CustomerCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'All Categories',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CustomerHomeCubit, CustomerHomeState>(
        builder: (context, state) {
          if (state is CustomerHomeLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
            );
          }

          if (state is CustomerHomeError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is CustomerHomeSuccess) {
            final allCategories = state.categories;
            final List<CategoryModel> categories = allCategories.length > 1
                ? allCategories.sublist(1, allCategories.length > 5 ? 5 : allCategories.length)
                : [];
            
            return GridView.builder(
              padding: EdgeInsets.all(20.w),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    context.push(
                      AppRouter.categoryProducts,
                      extra: {'id': category.id, 'name': category.name},
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B2332),
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(color: const Color(0xFF2C3545)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: category.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[800],
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFF6C63FF),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.category_outlined,
                              color: Color(0xFF6C63FF),
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        category.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeightHelper.bold,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
