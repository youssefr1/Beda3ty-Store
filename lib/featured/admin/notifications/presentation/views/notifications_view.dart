import 'package:astro/core/common/loading/loading_shimmer.dart';
import 'package:astro/core/common/screens/noScreen.dart';
import 'package:astro/core/common/widjets/custom_admin_appbar.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/notification_cubit.dart';
import '../widgets/notification_item.dart';
import 'package:astro/core/extensions/context_extensions.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotificationCubit>()..fetchNotifications(),
      child: Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: const CustomAdminAppbar(
          title: 'Notifications',
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              if (state is NotificationLoading) {
                return ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (_, __) => SizedBox(height: 15.h),
                  itemBuilder: (context, index) {
                    return LoadingShimmer(
                      height: 100.h,
                      borderRadius: 15,
                    );
                  },
                );
              } else if (state is NotificationSuccess) {
                if (state.notifications.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Notifications",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return RefreshIndicator(
                  color: context.color.bluePinkDark,
                  onRefresh: () async {
                    context.read<NotificationCubit>().fetchNotifications();
                  },
                  child: ListView.separated(
                    itemCount: state.notifications.length,
                    separatorBuilder: (_, __) => SizedBox(height: 15.h),
                    itemBuilder: (context, index) {
                      return NotificationItem(
                        notification: state.notifications[index],
                        onDelete: () {
                          context.read<NotificationCubit>().deleteNotification(state.notifications[index].id);
                        },
                      );
                    },
                  ),
                );
              } else if (state is NotificationFailure) {
                return Center(child: Text("Error: ${state.error}", style: const TextStyle(color: Colors.red)));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
