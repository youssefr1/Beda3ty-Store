import 'package:astro/core/common/widjets/custom_admin_appbar.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/featured/admin/add_categories/presentation/refactor/add_category_body.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/getall%20categories/get_all_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategoriesView extends StatelessWidget {
  const AddCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:  (context) => sl<GetAllCategoriesBloc>()..add(CategoryEvent()),
      child: const Scaffold(
        appBar: CustomAdminAppbar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Categories',
        ),
        backgroundColor: ColorsDark.mainColor,
        body: AddCategoryBody(),
      ),
    );
  }
}
