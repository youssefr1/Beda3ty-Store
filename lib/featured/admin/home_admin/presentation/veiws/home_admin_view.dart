import 'package:astro/core/common/widjets/custom_admin_appbar.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:astro/core/utils/admin_drawer_list.dart';
import 'package:astro/featured/admin/dashboard/presentation/veiws/dashboard_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  Widget page = const DashboardView();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuAdminDrawer(
            onChangedPage: (a) {
              setState(() {
                page = a;
                ZoomDrawer.of(context)!.close();
              });
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24,
      showShadow: true,
      drawerShadowsBackgroundColor: ColorsDark.mainColor.withOpacity(0.6),
      menuBackgroundColor: ColorsDark.blueDark,
    );
  }
}

class MenuAdminDrawer extends StatelessWidget {
  const MenuAdminDrawer({required this.onChangedPage, super.key});
  final void Function(Widget) onChangedPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.blueDark,
      appBar: const CustomAdminAppbar(
        isMain: false,
        backgroundColor: ColorsDark.blueDark,
        title: 'Sooqly ٍStore',
      ),
      body: Column(
        children: [
          Column(
            children:
                adminDrwaerList(
                      context,
                    )
                    .map(
                      (e) => ListTile(
                        onTap: () {
                          onChangedPage(e.page);
                        },
                        title: e.title,
                        leading: e.icon,
                      ),
                    )
                    .toList(),
          ),
          Expanded(
            child: Image.asset(
              "assets/assets/images/core/logo.png",
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
