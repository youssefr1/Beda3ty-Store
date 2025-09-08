

import 'package:astro/astro_store_app.dart';
import 'package:astro/featured/splash/presentation/views/widjets/Sliding_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimationText;
  late Animation<Offset> slidingAnimationImage;

  @override
  void initState() {
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingImage(slidingAnimationImage: slidingAnimationImage),
        const SizedBox(height: 16),

      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 6), () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const Beda3tyStoreApp()));
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    );
    animationController.forward();
    super.initState();

    slidingAnimationText = Tween<Offset>(
      begin: const Offset(0, 18),
      end: Offset.zero,
    ).animate(animationController);

    slidingAnimationImage = Tween<Offset>(
      begin: const Offset(0, -12),
      end: Offset.zero,
    ).animate(animationController);

    slidingAnimationText.addListener(() {
      setState(() {});
    });
    slidingAnimationImage.addListener(() {
      setState(() {});
    });
  }
}
