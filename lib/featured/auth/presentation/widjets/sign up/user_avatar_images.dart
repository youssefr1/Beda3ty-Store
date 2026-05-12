import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/show_toast.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatarImages extends StatelessWidget {
  const UserAvatarImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          if (state is UploadImageSuccess) {
            ShowToast.showToastSuccessTop(
              message: context.translate(
                LangKeys.imageUploaded,
              ),
            );
          } else if (state is UploadImageRemoveImage) {
            ShowToast.showToastSuccessTop(
              message: context.translate(LangKeys.imageRemoved),
            );
          } else if (state is UploadImageFailure) {
            ShowToast.showToastErrorTop(message: state.errmessage);
          }
        },
        builder: (context, state) {
          final isImageUploaded = context
              .read<UploadImageCubit>()
              .getImageUrl
              .isNotEmpty;
          
          if (state is UploadImageLoading) {
            return CircleAvatar(
              radius: 38,
              backgroundImage: const AssetImage(
                AppImages.userAvatar,
              ),
              child: CircularProgressIndicator(
                color: context.color.textColor,
              ),
            );
          } else {
            return CircleAvatar(
              radius: 38,
              backgroundImage: isImageUploaded
                  ? NetworkImage(
                          context.read<UploadImageCubit>().getImageUrl,
                        )
                        as ImageProvider
                  : const AssetImage(
                      AppImages.userAvatar,
                    ),
              backgroundColor: Colors.grey.withOpacity(0.1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isImageUploaded
                          ? Colors.transparent
                          : Colors.black.withOpacity(
                              0.4,
                            ),
                    ),
                  ),

                  Positioned(
                    top: -15,
                    right: -15,
                    child: IconButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().removeImage();
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  if (isImageUploaded)
                    const SizedBox.shrink()
                  else
                    IconButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().uploadImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
