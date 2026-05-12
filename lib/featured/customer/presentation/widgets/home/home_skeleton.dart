import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer({
    required this.width,
    required this.height,
    this.borderRadius = 8,
    super.key,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF1B2332),
      highlightColor: const Color(0xFF2C3545),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
    );
  }
}

class CategorySkeleton extends StatelessWidget {
  const CategorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SkeletonContainer(width: 100.w, height: 20.h),
            SkeletonContainer(width: 60.w, height: 15.h),
          ],
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
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
                    SkeletonContainer(width: 45.w, height: 45.w, borderRadius: 22.5),
                    SizedBox(height: 8.h),
                    SkeletonContainer(width: 50.w, height: 12.h),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkeletonContainer(width: 150.w, height: 20.h),
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
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1B2332),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: const Color(0xFF2C3545)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SkeletonContainer(
                      width: double.infinity,
                      height: double.infinity,
                      borderRadius: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonContainer(width: 100.w, height: 14.h),
                        SizedBox(height: 8.h),
                        SkeletonContainer(width: 60.w, height: 16.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
