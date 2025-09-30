import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:astro/core/utils/image_pick.dart';
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
        listener: (context, state) {},
            builder: (context, state) {
              final isImageUploaded = context
                  .read<UploadImageCubit>()
                  .getImageUrl
                  .isNotEmpty;
              return state.maybeWhen(
                orElse: () {
                  return CircleAvatar(
                    radius: 38,
                    backgroundImage: isImageUploaded
                        ? NetworkImage(
                                context
                                    .read<
                                      UploadImageCubit
                                    >()
                                    .getImageUrl,
                              )
                              as ImageProvider
                        : AssetImage(
                            AppImages.userAvatar,
                          ),
                    backgroundColor: Colors.black
                        .withOpacity(0.2),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 100.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(
                              0.4,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context
                                .read<UploadImageCubit>()
                                .uploadImage();
                          },
                          icon: Icon(
                            Icons.add_a_photo,
                            color: context.color.textColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                loading: () {
                  return CircleAvatar(
                    radius: 38,
                    backgroundImage:const AssetImage(
                      AppImages.userAvatar,
                    ),
                    child: CircularProgressIndicator(
                      color: context.color.textColor,
                    ),
                  );
                },
              );
            },
          ),
    );
  }
}
