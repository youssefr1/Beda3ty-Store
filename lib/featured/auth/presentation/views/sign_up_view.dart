import 'package:astro/featured/auth/presentation/widjets/botton_navigator_bar.dart';
import 'package:astro/featured/auth/presentation/widjets/login/login_body_view.dart';
import 'package:astro/featured/auth/presentation/widjets/sign%20up/sign_up_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavigatorBar(),
      body: SafeArea(
        bottom: false,
        child: SignUpBody(),
      ),
    );;
  }
}
