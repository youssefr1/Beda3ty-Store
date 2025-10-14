import 'package:astro/core/common/widjets/custom_button.dart';
import 'package:astro/core/common/widjets/custom_text_field.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/admin/add_categories/presentation/widjets/create/category_upload_product.dart';
import 'package:astro/featured/admin/add_categories/presentation/widjets/update/update_category_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateCategoryButton extends StatefulWidget {
  const UpdateCategoryButton({super.key});


  @override
  State<UpdateCategoryButton> createState() => _UpdateCategoryButtonState();
}

class _UpdateCategoryButtonState extends State<UpdateCategoryButton> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController =
  TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
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
                text: 'Update Category',
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
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: 'Update a photo',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    fontFamily: 'Poppins',
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            // upload photo
            const UpdateCategoryPhoto(imageurl: 'https://plus.unsplash.com/premium_photo-1680538420450-ff2f4c19faa9?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',),
            SizedBox(
              height: 20.h,
            ),
            // enter the category name
            TextApp(
              text: 'Update the Category name',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: 'Poppins',
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: CustomTextField(
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter the Category name',
                validator: (value) {
                  if (value!.isEmpty ||
                      value == null ||
                      value.length < 2) {
                    return 'please enter valid category name';
                  }
                  return null;
                },
              ),
            ),
            CustomButton(
              onPressed: (){},
              text: ' Create a new category',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              threeRadius: 20,
              lastRadius: 20,
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
