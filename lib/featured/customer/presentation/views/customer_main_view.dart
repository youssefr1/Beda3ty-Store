import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/featured/customer/cubit/cart_cubit.dart';
import 'package:astro/featured/customer/cubit/customer_home_cubit.dart';
import 'package:astro/featured/customer/presentation/views/customer_cart_view.dart';
import 'package:astro/featured/customer/presentation/views/customer_categories_view.dart';
import 'package:astro/featured/customer/presentation/views/customer_home_view.dart';
import 'package:astro/featured/customer/presentation/views/customer_wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astro/featured/customer/cubit/notification_cubit.dart';
import 'package:astro/featured/customer/cubit/wishlist_cubit.dart';

class CustomerMainView extends StatefulWidget {
  const CustomerMainView({super.key});

  @override
  State<CustomerMainView> createState() => _CustomerMainViewState();
}

class _CustomerMainViewState extends State<CustomerMainView> {
  int _currentIndex = 0;

  final List<Widget> _views = const [
    CustomerHomeView(),
    CustomerCategoriesView(),
    CustomerCartView(),
    CustomerWishlistView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CustomerHomeCubit>()..getHomeData(),
        ),
        BlocProvider(
          create: (context) => sl<CartCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<WishlistCubit>(),
        ),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _views,
        ),
        bottomNavigationBar: Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: const Color(0xFF1B2332),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFF1B2332),
              selectedItemColor: const Color(0xFF6C63FF),
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontSize: 10.sp),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view_outlined),
                  activeIcon: Icon(Icons.grid_view_rounded),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  activeIcon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  activeIcon: Icon(Icons.favorite),
                  label: 'Wishlist',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
