import 'package:astro/core/common/loading/loading_shimmer.dart';
import 'package:astro/core/common/widjets/custom_admin_appbar.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/featured/admin/users/presentation/cubit/users_cubit.dart';
import 'package:astro/featured/admin/users/presentation/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astro/core/extensions/context_extensions.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UsersCubit>()..fetchUsers(),
      child: Scaffold(
        backgroundColor: ColorsDark.mainColor,
        appBar: const CustomAdminAppbar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Users',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              if (state is UsersLoading) {
                return ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (_, __) => SizedBox(height: 15.h),
                  itemBuilder: (context, index) {
                    return LoadingShimmer(
                      height: 80.h,
                      borderRadius: 15,
                    );
                  },
                );
              } else if (state is UsersSuccess) {
                if (state.users.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Users Found",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return RefreshIndicator(
                  color: context.color.bluePinkDark,
                  onRefresh: () async {
                    context.read<UsersCubit>().fetchUsers();
                  },
                  child: ListView.separated(
                    itemCount: state.users.length,
                    separatorBuilder: (_, __) => SizedBox(height: 15.h),
                    itemBuilder: (context, index) {
                      return UserItem(
                        user: state.users[index],
                        onDelete: () {
                          // Confirm delete dialog could be added here
                          context.read<UsersCubit>().deleteUser(state.users[index].id);
                        },
                      );
                    },
                  ),
                );
              } else if (state is UsersFailure) {
                return Center(
                  child: Text(
                    "Error: ${state.error}",
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
