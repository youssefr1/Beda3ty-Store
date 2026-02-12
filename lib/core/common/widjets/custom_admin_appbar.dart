import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomAdminAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAdminAppbar({
    super.key,
    required this.isMain,
    required this.backgroundColor,
    required this.title,
  });

  final bool isMain;
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: TextApp(
        text: title,
        theme: context.textStyle.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamilyHelper.poppinsEnglish,
        ),
      ),
      leading: isMain? IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: Icon(Icons.menu, color: Colors.white),
      ):SizedBox.shrink(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50.h);
}
