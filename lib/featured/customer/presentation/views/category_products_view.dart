import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/customer/cubit/category_products_cubit.dart';
import 'package:astro/featured/customer/cubit/category_products_state.dart';
import 'package:astro/featured/customer/data/model/customer_product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({
    required this.categoryId,
    required this.categoryName,
    super.key,
  });

  final int categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryProductsCubit>()..getProductsByCategory(categoryId),
      child: Scaffold(
        backgroundColor: context.color.mainColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            categoryName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
          builder: (context, state) {
            if (state is CategoryProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
              );
            }

            if (state is CategoryProductsError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (state is CategoryProductsSuccess) {
              final products = state.products;

              if (products.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag_outlined, color: Colors.white24, size: 80.sp),
                      SizedBox(height: 15.h),
                      Text(
                        'No products found in this category',
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      ),
                    ],
                  ),
                );
              }

              return GridView.builder(
                padding: EdgeInsets.all(20.w),
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        AppRouter.productDetails,
                        extra: product,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1B2332),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: const Color(0xFF2C3545)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.r),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: product.images.isNotEmpty ? product.images[0] : "",
                                    width: double.infinity,
                                    height: double.infinity,
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
                                    errorWidget: (context, url, error) => Container(
                                      color: Colors.grey[800],
                                      child: Icon(Icons.image, color: Colors.white24, size: 40.sp),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10.h,
                                  right: 10.w,
                                  child: Container(
                                    padding: EdgeInsets.all(5.w),
                                    decoration: const BoxDecoration(
                                      color: Colors.black26,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 18.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeightHelper.medium,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  r'$' + product.price.toString(),
                                  style: TextStyle(
                                    color: const Color(0xFF6C63FF),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeightHelper.bold,
                                  ),
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
