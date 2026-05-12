import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/customer/cubit/cart_cubit.dart';
import 'package:astro/featured/customer/presentation/widgets/cart/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerCartView extends StatelessWidget {
  const CustomerCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final items = context.read<CartCubit>().items;

          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                    size: 80.sp,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  itemCount: items.length + 1, // +1 for PromoCodeSection
                  itemBuilder: (context, index) {
                    if (index < items.length) {
                      return CartItem(item: items[index]);
                    } else {
                      return const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: _PromoCodeSection(),
                      );
                    }
                  },
                ),
              ),
              _CartSummarySection(subtotal: context.read<CartCubit>().subtotal),
            ],
          );
        },
      ),
    );
  }
}

class _PromoCodeSection extends StatelessWidget {
  const _PromoCodeSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.local_offer_outlined,
              color: Color(0xFF6C63FF),
              size: 18,
            ),
            SizedBox(width: 10.w),
            Text(
              'Promo Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B2332),
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: const Color(0xFF2C3545)),
                ),
                child: Text(
                  'Enter code',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C63FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
              ),
              child: const Text('Apply'),
            ),
          ],
        ),
      ],
    );
  }
}

class _CartSummarySection extends StatelessWidget {
  const _CartSummarySection({required this.subtotal});

  final double subtotal;

  @override
  Widget build(BuildContext context) {
    const double shipping = 9.99;
    final double total = subtotal + shipping;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2332),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Column(
        children: [
          _summaryRow('Subtotal', r'$' + subtotal.toStringAsFixed(2)),
          SizedBox(height: 10.h),
          _summaryRow('Shipping', r'$' + shipping.toStringAsFixed(2)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: const Divider(color: Color(0xFF2C3545)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              Text(
                r'$' + total.toStringAsFixed(2),
                style: TextStyle(
                  color: const Color(0xFF6C63FF),
                  fontSize: 22.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            width: double.infinity,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF3F3D56)],
              ),
            ),
            child: Center(
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
      ],
    );
  }
}
