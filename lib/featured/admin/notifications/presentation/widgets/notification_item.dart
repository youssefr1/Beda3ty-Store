import 'package:astro/core/common/widjets/custom_container_linear_admin.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/notification_model.dart';
import 'package:astro/core/extensions/context_extensions.dart';

class NotificationItem extends StatelessWidget {

  const NotificationItem({super.key, required this.notification, required this.onDelete});
  final NotificationModel notification;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 100.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notification.title,
                        style: context.textStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamilyHelper.poppinsEnglish,
                        ),
                      ),
                      Text(
                        notification.type.toUpperCase(),
                        style: context.textStyle.copyWith(
                          fontSize: 12.sp,
                          color: notification.type == 'admin' ? Colors.redAccent : Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    notification.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
