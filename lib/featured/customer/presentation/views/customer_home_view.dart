import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/featured/customer/presentation/sections/customer_home_body.dart';
import 'package:flutter/material.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      body: const SafeArea(
        child: CustomerHomeBody(),
      ),
    );
  }
}
