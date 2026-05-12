import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/customer/data/model/customer_product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({required this.categories, super.key});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    // Filter to show only 2nd, 3rd, 4th, 5th, and 6th categories (indices 1 to 5)
    final List<CategoryModel> displayedCategories = categories.length > 1
        ? categories.sublist(1, categories.length > 5 ? 5 : categories.length)
        : [];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            Text(
              'See All >',
              style: TextStyle(
                color: const Color(0xFF6C63FF),
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: displayedCategories.length,
            itemBuilder: (context, index) {
              final category = displayedCategories[index];
              return GestureDetector(
                onTap: () {
                  context.push(
                    AppRouter.categoryProducts,
                    extra: {'id': category.id, 'name': category.name},
                  );
                },
                child: Container(
                  width: 90.w,
                  margin: EdgeInsets.only(right: 15.w),
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B2332),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: const Color(0xFF2C3545)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45.w,
                        height: 45.w,
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
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        category.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeightHelper.medium,
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
          ),
        ),
      ],
    );
  }
}
