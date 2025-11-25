import 'package:astro/core/common/widjets/custom_admin_appbar.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/featured/admin/add_products/presentation/refactor/add_product_body.dart';
import 'package:astro/featured/admin/add_products/presentation/view%20modell/getall%20product/get_all_product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GetAllProductCubit>()..getAllProducts(),
      child: const Scaffold(
        appBar: CustomAdminAppbar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Products',
        ),
        backgroundColor: ColorsDark.mainColor,
        body: AddProductBody(),
      ),
    );
  }
}
