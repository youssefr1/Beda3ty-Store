import 'package:astro/core/styles/images/app_images.dart';
import 'package:astro/featured/admin/dashboard/presentation/veiws/widjets/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardBodyView extends StatelessWidget {
  const DashboardBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 30.w,
      ),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: const [
            // products
            DashboardContainer(
              title: 'Products',
              number: '0',
              image: AppImages.productsDrawer,
              isLoaidng: false,
            ),
            // Categories
            DashboardContainer(
              title: 'Categories',
              number: '0',
              image: AppImages.categoriesDrawer,
              isLoaidng: false,
            ),
            // Users
            DashboardContainer(
              title: 'Users',
              number: '0',
              image: AppImages.usersDrawer,
              isLoaidng: false,
            ),
            //
          ],
        ),
      ),
    );
  }
}
