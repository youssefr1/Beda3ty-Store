import 'package:astro/core/common/widjets/custom_admin_appbar.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAdminAppbar(
        isMain: true,
        backgroundColor: ColorsDark.mainColor,
        title: 'Users',
      ),
      backgroundColor: ColorsDark.mainColor,
      body: Center(
        child: Text(
          'Users Views',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
