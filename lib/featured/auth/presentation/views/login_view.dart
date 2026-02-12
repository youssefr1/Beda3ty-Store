import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/featured/auth/presentation/widjets/auth_custom_painter.dart';
import 'package:astro/featured/auth/presentation/widjets/botton_navigator_bar.dart';
import 'package:astro/featured/auth/presentation/widjets/login/login_body_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigatorBar(),
      body: SafeArea(
        bottom: false,
        child: LoginBodyView(),
      ),
    );
  }
}

