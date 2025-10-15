import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/bottom%20sheet/custom_bottom_sheet.dart';
import 'package:astro/core/common/widjets/custom_button.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/di/injection_container.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/create%20categories/create_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/getall%20categories/get_all_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/widjets/create/create_category_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCategory extends StatelessWidget {
  const CreateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFadeInRight(
          duration: 400,
          child: TextApp(
            text: 'Get All Categories',
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
            onPressed: () async{

              await CustomBottomSheet.showModelBottomSheetContainer(
                context: context,
                widjet: MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => sl<CreateCategoriesBloc>()),
                    BlocProvider(create: (context) => sl<UploadImageCubit>()),
                  ],
                  child: const CreateCategoryWdjet(),
                ),
              );
                // ✅ بعد ما يتقفل الـ BottomSheet، نعمل refresh
              context.read<GetAllCategoriesBloc>().add(CategoryEvent());
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
