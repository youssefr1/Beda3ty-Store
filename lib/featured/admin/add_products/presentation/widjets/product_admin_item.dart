import 'package:astro/core/common/bottom%20sheet/custom_bottom_sheet.dart';
import 'package:astro/core/common/widjets/custom_container_linear_admin.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:astro/featured/admin/add_products/presentation/widjets/update/update_product_bottomsheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductAdminItem extends StatelessWidget {
  const ProductAdminItem({
    required this.imageUrl,
    required this.title,
    required this.categoryName,
    required this.price,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String categoryName;
  final String price;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 250.h,
      width: 165.w,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // delete button and Update Button in the Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Delete Button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 25,
                  ),
                ),
                //Update Button
                IconButton(
                  onPressed: () {
                    CustomBottomSheet.showModelBottomSheetContainer(
                      context: context,
                      widjet: const UpdateProductBottomsheet(),
                    );
                  },
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                    size: 25,
                  ),
                ),
              ],
            ),

            // Product Image
            Flexible(
              child: Center(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageUrl,
                  errorWidget: (context, url, error) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 70,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            // title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: title,
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
                maxLines: 1,
              ),
            ),

            SizedBox(
              height: 7.h,
            ),
            // category name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: TextApp(
                text: categoryName,
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
                maxLines: 1,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: TextApp(
                text: '\$ $price',
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
