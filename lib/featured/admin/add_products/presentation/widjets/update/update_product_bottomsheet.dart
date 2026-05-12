import 'dart:ffi';

import 'package:astro/core/common/widjets/custom_button.dart';
import 'package:astro/core/common/widjets/custom_drop_down.dart';
import 'package:astro/core/common/widjets/custom_text_field.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/featured/admin/add_products/presentation/widjets/update/update_product_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductBottomsheet extends StatefulWidget {
  const UpdateProductBottomsheet({super.key});

  @override
  State<UpdateProductBottomsheet> createState() =>
      _UpdateProductBottomsheetState();
}

class _UpdateProductBottomsheetState extends State<UpdateProductBottomsheet> {
  final fromKey = GlobalKey<FormState>();
  TextEditingController titleControler = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String? categoryName;

  @override
  void dispose() {
    titleControler.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
        key: fromKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextApp(
                  text: 'Update Product',
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
              TextApp(
                text: 'Update photo',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // update Image
              const UpdateProductImages(),
              SizedBox(
                height: 20.h,
              ),
              TextApp(
                text: 'Title',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: titleControler,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter new title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid title';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              TextApp(
                text: 'Price',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                hintText: 'Enter new Price',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid Price';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              TextApp(
                text: 'Description',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                controller: descriptionController,
                keyboardType: TextInputType.multiline,
                hintText: 'Enter new Description',
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Description';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              TextApp(
                text: 'Category',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomCreateDropDown(
                items: ['ahmed', 'sdasa'],
                hintText: 'macbook',
                onChanged: (value) {
                  setState(() {
                    categoryName = value;
                  });
                },
                value: categoryName,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onPressed: () {},
                backgroundColor: Colors.green,
                lastRadius: 20,
                threeRadius: 20,
                text: 'Update Product',
                width: MediaQuery.of(context).size.width,
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
