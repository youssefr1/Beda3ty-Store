import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/bottom%20sheet/custom_bottom_sheet.dart';
import 'package:astro/core/common/widjets/custom_button.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:astro/featured/admin/add_products/presentation/widjets/create/create_product_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProducts extends StatelessWidget {
  const CreateProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFadeInRight(
          duration: 400,
          child: TextApp(
            text: 'Get All Products',
            theme: context.textStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamilyHelper.poppinsEnglish,
            ),
          ),
        ),
        CustomFadeInLeft(
          duration: 400,
          child: CustomButton(
            onPressed: () {
              CustomBottomSheet.showModelBottomSheetContainer(
                context: context,
                widjet: CreateProductBottomsheet(),
              );
            },
            text: 'Add',
            width: 82.w,
            height: 35.h,
            lastRadius: 10,
            threeRadius: 10,
            backgroundColor: context.color.bluePinkDark,
          ),
        ),
      ],
    );
  }
}
