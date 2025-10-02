import 'package:astro/core/common/widjets/custom_admin_appbar.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/core/utils/admin_drawer_list.dart';
import 'package:astro/featured/admin/dashboard/presentation/veiws/widjets/dashboard_body_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAdminAppbar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Dashboard',
      ),
      backgroundColor: ColorsDark.mainColor,
      body: DashboardBodyView()
    );

  }
}
