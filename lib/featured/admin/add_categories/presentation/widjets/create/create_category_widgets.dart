import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/common/widjets/custom_button.dart';
import 'package:astro/core/common/widjets/custom_text_field.dart';
import 'package:astro/core/common/widjets/show_toast.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/create%20categories/create_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/getall%20categories/get_all_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/widjets/create/category_upload_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCategoryWdjet extends StatefulWidget {
  const CreateCategoryWdjet({super.key});

  @override
  State<CreateCategoryWdjet> createState() => _CreateCategoryWdjetState();
}

class _CreateCategoryWdjetState extends State<CreateCategoryWdjet> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextApp(
                text: 'Create Category',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: 'Add a photo',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    fontFamily: 'Poppins',
                  ),
                ),
                // remove Button image
                BlocBuilder<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                    if (state is UploadImageInitial) {
                      return const SizedBox.shrink();
                    } else {
                      return CustomButton(
                        onPressed: () {
                          context.read<UploadImageCubit>().removeImage();
                        },
                        text: 'Remove',
                        width: 120.w,
                        height: 35.h,
                        lastRadius: 10,
                        threeRadius: 10,
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            // upload photo
            const CategoryUploadProduct(),
            SizedBox(
              height: 20.h,
            ),
            TextApp(
              text: 'Enter the Category name',
              theme: context.textStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: 'Poppins',
              ),
            ),
            // Category text feild name
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: CustomTextField(
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Category name',
                hintStyle: context.textStyle.copyWith(
                  fontSize: 18,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'please enter valid category name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),

            // Create Category Button
            BlocConsumer<CreateCategoriesBloc, CreateCategoriesState>(
              listener: (context, state) {
                if (state is CreateCategoriesSuccess) {
                  ShowToast.showToastSuccessTop(
                    message: 'Created Successfully',
                  );
                  // ✅ في حالة النجاح
                  Navigator.pop(context);
                  context.read<GetAllCategoriesBloc>().add(CategoryEvent());

                  // 🧹 إعادة تعيين الحقول
                  nameController.clear();
                  context.read<UploadImageCubit>().removeImage();
                } else if (state is CreateCategoriesFailure) {
                  // ❌ في حالة الفشل
                  ShowToast.showToastErrorTop(
                    message: 'please try again',
                  );
                }
              },
              builder: (context, state) {
                if (state is CreateCategoriesLoading) {
                  return Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.color.bluePinkLight,
                      ),
                    ),
                  );
                } else {
                  return CustomButton(
                    onPressed: () {
                      _validCreateCategory(context);
                    },
                    text: 'Create a new category',
                    width: MediaQuery.of(context).size.width,
                    height: 50.h,
                    threeRadius: 20,
                    lastRadius: 20,
                    backgroundColor: Colors.green,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _validCreateCategory(BuildContext context) {
    // تحقق من الاسم والصورة
    if (!formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().getImageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: 'please pick your photo first',
        );
      }
      return;
    }

    // send Category
    context.read<CreateCategoriesBloc>().add(
      SubmitCreateCategory(
        name: nameController.text.trim(),
        image: context.read<UploadImageCubit>().getImageUrl,
      ),
    );
  }
}
