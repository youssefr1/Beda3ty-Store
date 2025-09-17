import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';

class UserAvatarImages extends StatelessWidget {
  const UserAvatarImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: CircleAvatar(
        radius: 38,
        child: Image.asset(AppImages.userAvatar,fit: BoxFit.cover,),
      ),
    );
  }
}
