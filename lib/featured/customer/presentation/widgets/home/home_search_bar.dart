import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2332),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: const Color(0xFF2C3545)),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey, size: 20.sp),
          SizedBox(width: 10.w),
          Text(
            'Search products...',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
