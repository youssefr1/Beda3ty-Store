import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/customer/cubit/cart_cubit.dart';
import 'package:astro/featured/customer/data/model/cart_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    required this.item,
    super.key,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2332),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF2C3545)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: CachedNetworkImage(
              imageUrl: item.product.images.isNotEmpty ? item.product.images[0] : '',
              width: 80.w,
              height: 80.w,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[800],
                child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[800],
                child: const Icon(Icons.image, color: Colors.white24),
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                Text(
                  item.product.category.name,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  r'$' + item.product.price.toString(),
                  style: TextStyle(
                    color: const Color(0xFF6C63FF),
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => context.read<CartCubit>().removeFromCart(item.product.id),
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent, size: 20),
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  _quantityButton(Icons.remove, () {
                    context.read<CartCubit>().updateQuantity(item.product.id, item.quantity - 1);
                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      item.quantity.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                  _quantityButton(Icons.add, () {
                    context.read<CartCubit>().updateQuantity(item.product.id, item.quantity + 1);
                  }, isPrimary: true),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onTap, {bool isPrimary = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF6C63FF) : Colors.grey[800],
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 14.sp),
      ),
    );
  }
}

