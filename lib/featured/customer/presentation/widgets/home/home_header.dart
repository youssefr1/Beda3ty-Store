import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/customer/cubit/notification_cubit.dart';
import 'package:astro/featured/customer/presentation/views/customer_notifications_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back,',
              style: context.textStyle.copyWith(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            Text(
              'Ahmed',
              style: context.textStyle.copyWith(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            BlocBuilder<NotificationCubit, NotificationState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    context.read<NotificationCubit>().markAsRead();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CustomerNotificationsView()),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2C3545),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                      if (state.unreadCount > 0)
                        Positioned(
                          right: 10.w,
                          top: 10.h,
                          child: Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(width: 15.w),
            CircleAvatar(
              radius: 22.r,
              backgroundColor: const Color(0xFF6C63FF),
              child: Text(
                'A',
                style: context.textStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
