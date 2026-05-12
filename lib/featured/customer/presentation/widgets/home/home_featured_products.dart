import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/customer/data/model/customer_product_model.dart';
import 'package:astro/featured/customer/cubit/wishlist_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeFeaturedProducts extends StatelessWidget {
  const HomeFeaturedProducts({required this.products, super.key});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured Products',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(height: 15.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
          ),
          itemCount: products.length > 10 ? 10 : products.length, // Limit to 10 for home
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
                          BlocBuilder<WishlistCubit, WishlistState>(
                            builder: (context, state) {
                              final isFav = context.read<WishlistCubit>().isFavorite(product.id);
                              return Positioned(
                                top: 10.h,
                                right: 10.w,
                                child: GestureDetector(
                                  onTap: () => context.read<WishlistCubit>().toggleWishlist(product),
                                  child: Container(
                                    padding: EdgeInsets.all(5.w),
                                    decoration: const BoxDecoration(
                                      color: Colors.black26,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      isFav ? Icons.favorite : Icons.favorite_border,
                                      color: isFav ? Colors.red : Colors.white,
                                      size: 18.sp,
                                    ),
                                  ),
                                ),
                              );
                            },
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
        ),
      ],
    );
  }
}
