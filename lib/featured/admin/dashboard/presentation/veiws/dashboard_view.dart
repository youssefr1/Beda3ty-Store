import 'package:astro/core/common/widjets/custom_admin_appbar.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:astro/core/utils/admin_drawer_list.dart';
import 'package:astro/featured/admin/dashboard/presentation/veiws/widjets/dashboard_body_view.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/category/categories_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/products/products_number_bloc.dart';
import 'package:astro/featured/admin/dashboard/presentation/view%20model/users/users_number_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsNumberBloc(sl())
            ..add(const ProductsNumberEvent.getProductNumber(),),
        ),
        BlocProvider(
          create: (context) => CategoriesNumberBloc(sl())
            ..add(const CategoriesNumberEvent.getCategoryNumber(),),
        ),
        BlocProvider(
          create: (context) => UsersNumberBloc(sl())
            ..add(const UsersNumberEvent.getUserNumber()),
        ),
      ],
      child: const Scaffold(
        appBar: CustomAdminAppbar(
          isMain: true,
          backgroundColor: ColorsDark.mainColor,
          title: 'Dashboard',
        ),
        backgroundColor: ColorsDark.mainColor,
        body: DashboardBodyView(),
      ),
    );
  }
}
