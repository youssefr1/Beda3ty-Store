import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/common/widjets/custom_button.dart';
import 'package:astro/core/common/widjets/custom_text_field.dart';
import 'package:astro/core/common/widjets/show_toast.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/getall%20categories/get_all_categories_bloc.dart';
import 'package:astro/featured/admin/add_categories/presentation/view_model/update%20categories/update_categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UpdateCategoryButton extends StatefulWidget {
  final int categoryId;
  final String oldName;
  final String oldImage;

  const UpdateCategoryButton({
    super.key,
    required this.categoryId,
    required this.oldName,
    required this.oldImage,
  });

  @override
  State<UpdateCategoryButton> createState() => _UpdateCategoryButtonState();
}

class _UpdateCategoryButtonState extends State<UpdateCategoryButton> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.oldName);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
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
            SizedBox(height: 20.h),

            TextApp(
              text: 'Update Category Photo',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 20.h),

            /// 🖼️ BlocBuilder to display and upload new image
            BlocBuilder<UploadImageCubit, UploadImageState>(
              builder: (context, state) {
                final cubit = context.read<UploadImageCubit>();
                final imageUrl = cubit.getImageUrl.isNotEmpty
                    ? cubit.getImageUrl
                    : widget.oldImage;

                final hasNewImage = cubit.getImageUrl.isNotEmpty;

                return GestureDetector(
                  onTap: cubit.uploadImage,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      /// الصورة القديمة أو الجديدة
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 180.h,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            size: 60,
                            color: Colors.red,
                          ),
                        ),
                      ),

                      /// أيقونة Upload بتظهر فوق الصورة القديمة فقط
                      if (!hasNewImage)
                        Container(
                          height: 180.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload,
                                color: Colors.white,
                                size: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Tap to upload new photo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 20.h),

            TextApp(
              text: 'Update Category Name',
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
                hintText: 'Enter new category name',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Please enter a valid category name';
                  }
                  return null;
                },
              ),
            ),

            BlocConsumer<UpdateCategoryBloc, UpdateCategoryState>(
              listener: (context, state) {
                if (state is UpdateCategorySuccess) {
                  ShowToast.showToastSuccessTop(
                      message: 'Category Updated Successfully');
                  Navigator.pop(context,true);
                  context.read<GetAllCategoriesBloc>().add(CategoryEvent());
                } else if (state is UpdateCategoryFailure) {
                  ShowToast.showToastErrorTop(message: state.error);
                }
              },
              builder: (context, state) {
                if (state is UpdateCategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  onPressed: () => _updateCategory(context),
                  text: 'Update Category',
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  threeRadius: 20,
                  lastRadius: 20,
                  backgroundColor: Colors.green,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _updateCategory(BuildContext context) {
    if (!formKey.currentState!.validate()) return;

    final cubit = context.read<UploadImageCubit>();
    final newImage = cubit.getImageUrl.isEmpty
        ? widget.oldImage
        : cubit.getImageUrl;

    context.read<UpdateCategoryBloc>().add(
      SubmitUpdateCategory(
        id: widget.categoryId,
        name: nameController.text.trim(),
        image: newImage,
      ),
    );
  }
}
