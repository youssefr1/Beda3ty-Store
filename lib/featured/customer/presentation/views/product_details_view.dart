import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/customer/data/model/customer_product_model.dart';
import 'package:astro/featured/customer/cubit/cart_cubit.dart';
import 'package:astro/featured/customer/cubit/wishlist_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({required this.product, super.key});

  final ProductModel product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.mainColor,
      body: Stack(
        children: [
          // Content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // Image Carousel Header
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 400.h,
                      child: PageView.builder(
                        onPageChanged: (index) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        itemCount: widget.product.images.length,
                        itemBuilder: (context, index) {
                          return CachedNetworkImage(
                            imageUrl: widget.product.images[index],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[900],
                              child: const Center(
                                child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[900],
                              child: const Icon(Icons.image, color: Colors.white24, size: 50),
                            ),
                          );
                        },
                      ),
                    ),
                    // Back Button
                    Positioned(
                      top: 50.h,
                      left: 20.w,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                    // Image Indicators
                    if (widget.product.images.length > 1)
                      Positioned(
                        bottom: 20.h,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            widget.product.images.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              width: _currentImageIndex == index ? 20.w : 8.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: _currentImageIndex == index
                                    ? const Color(0xFF6C63FF)
                                    : Colors.white54,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Product Info
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: context.color.mainColor,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.sp,
                                fontWeight: FontWeightHelper.bold,
                              ),
                            ),
                          ),
                          BlocBuilder<WishlistCubit, WishlistState>(
                            builder: (context, state) {
                              final isFav = context.read<WishlistCubit>().isFavorite(widget.product.id);
                              return GestureDetector(
                                onTap: () => context.read<WishlistCubit>().toggleWishlist(widget.product),
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1B2332),
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(color: const Color(0xFF2C3545)),
                                  ),
                                  child: Icon(
                                    isFav ? Icons.favorite : Icons.favorite_border,
                                    color: isFav ? Colors.red : Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        r'$' + widget.product.price.toString(),
                        style: TextStyle(
                          color: const Color(0xFF6C63FF),
                          fontSize: 22.sp,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      // Category Tag
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C63FF).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: const Color(0xFF6C63FF).withOpacity(0.3)),
                        ),
                        child: Text(
                          widget.product.category.name,
                          style: TextStyle(
                            color: const Color(0xFF6C63FF),
                            fontSize: 12.sp,
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        widget.product.description,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15.sp,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 100.h), // Space for bottom bar
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom Navigation Bar (Add to Cart)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: const Color(0xFF1B2332).withOpacity(0.95),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                border: Border.all(color: const Color(0xFF2C3545)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                        ),
                        Text(
                          r'$' + widget.product.price.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeightHelper.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<CartCubit>().addToCart(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${widget.product.title} added to cart!'),
                            backgroundColor: const Color(0xFF6C63FF),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeightHelper.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
