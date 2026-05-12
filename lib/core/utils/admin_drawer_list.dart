import 'package:astro/core/common/widjets/custom_dialogs.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/services/shared_pref/pref_keys.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:astro/featured/admin/add_categories/presentation/veiws/add_categories_view.dart';
import 'package:astro/featured/admin/add_products/presentation/veiws/add_products_view.dart';
import 'package:astro/featured/admin/dashboard/presentation/veiws/dashboard_view.dart';
import 'package:astro/featured/admin/notifications/presentation/veiws/notifications_view.dart';
import 'package:astro/featured/admin/users/presentation/views/users_view.dart';
import 'package:astro/featured/auth/presentation/views/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<DrawerItemModel> adminDrwaerList(
  BuildContext context,
) {
  return <DrawerItemModel>[
    //DashBoard
    DrawerItemModel(
      icon: const Icon(
        Icons.dashboard,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Dashboard',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamilyHelper.poppinsEnglish,
        ),
      ),
      page: const DashboardView(),
    ),
    // Categories
    DrawerItemModel(
      icon: const Icon(
        Icons.category_rounded,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Categories',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamilyHelper.poppinsEnglish,
        ),
      ),
      page: const AddCategoriesView(),
    ),
    //Products
    DrawerItemModel(
      icon: const Icon(
        Icons.production_quantity_limits,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Products',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamilyHelper.poppinsEnglish,
        ),
      ),
      page: const AddProductsView(),
    ),
    //Users
    DrawerItemModel(
      icon: const Icon(
        Icons.person,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Users',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamilyHelper.poppinsEnglish,
        ),
      ),
      page: const UsersView(),
    ),
    // Notifications
    DrawerItemModel(
      icon: const Icon(
        Icons.notifications_active,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Notifications',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamilyHelper.poppinsEnglish,
        ),
      ),
      page: const NotificationsView(),
    ),
    DrawerItemModel(
      icon: const Icon(
        Icons.exit_to_app,
        color: Colors.white,
      ),
      title: GestureDetector(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: context.translate(LangKeys.logOutFromApp),
            textButton1: context.translate(LangKeys.yes),
            textButton2: context.translate(LangKeys.no),

            onPressed: () async {
              await SharedPref().removePreference(PrefKeys.accessToken);
              await SharedPref().removePreference(PrefKeys.refreshToken);
              await SharedPref().removePreference(PrefKeys.userRole);
              context.goRoute(AppRouter.login);
            },
            isLoading: false,
          );
        },
        child: TextApp(
          text: 'Logout',
          theme: context.textStyle.copyWith(
            fontSize: 17.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamilyHelper.poppinsEnglish,
          ),
        ),
      ),
      page: const LoginView(),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });

  final Icon icon;

  final Widget title;
  final Widget page;
}
