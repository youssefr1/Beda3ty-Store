import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/customer/cubit/wishlist_cubit.dart';
import 'package:astro/featured/customer/data/model/customer_product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomerWishlistView extends StatelessWidget {
  const CustomerWishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Wishlist',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          final products = context.read<WishlistCubit>().products;

          if (products.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, color: Colors.grey, size: 80.sp),
                  SizedBox(height: 20.h),
                  Text(
                    'Your wishlist is empty',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  '${products.length} items in your wishlist',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 15.h,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return _WishlistItem(product: products[index]);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _WishlistItem extends StatelessWidget {
  const _WishlistItem({required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
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
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                    child: CachedNetworkImage(
                      imageUrl: product.images.isNotEmpty ? product.images[0] : '',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[800],
                        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[800],
                        child: const Icon(Icons.image, color: Colors.white24),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: GestureDetector(
                      onTap: () => context.read<WishlistCubit>().toggleWishlist(product),
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 18,
                        ),
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
  }
}

