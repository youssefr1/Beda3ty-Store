import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/common/widjets/show_toast.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryUploadProduct extends StatelessWidget {
  const CategoryUploadProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        if (state is UploadImageSuccess) {
          ShowToast.showToastSuccessTop(
            message: context.translate(
              LangKeys.imageUploaded,
            ),
          );
        } else if (state is UploadImageRemoveImage) {
          ShowToast.showToastErrorTop(
            message: context.translate(LangKeys.imageRemoved),
          );
        } else if (state is UploadImageFailure) {
          ShowToast.showToastErrorTop(message: 'Please pick your photo');
        }
      },
      builder: (context, state) {
        if (state is UploadImageLoading) {
          return Container(
            height: 140.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        } else {
          if (context.read<UploadImageCubit>().getImageUrl.isNotEmpty) {
            return InkWell(
              onTap: () {
                context.read<UploadImageCubit>().uploadImage();
              },
              child: Container(
                height: 140.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      context.read<UploadImageCubit>().getImageUrl,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                context.read<UploadImageCubit>().uploadImage();
              },
              child: Container(
                height: 140.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload,
                      size: 50,
                      color: Colors.white,
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
            );
          }
        }
      },
    );
  }
}
