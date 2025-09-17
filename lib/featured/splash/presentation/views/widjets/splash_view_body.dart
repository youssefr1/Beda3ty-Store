import 'package:astro/sooqly_store_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/featured/splash/presentation/views/widjets/Sliding_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() =>
      _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimationText;
  late Animation<Offset> slidingAnimationImage;

  @override
  void initState() {
    super.initState();
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
        SlidingImage(
          slidingAnimationImage: slidingAnimationImage,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.goRoute(AppRouter.login); // ✅ يروح لـ screen1 ويمسح السبلاش من الـ stack
      }
    });
  }



  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2850), // أو أي مدة تناسبك
    );

    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    slidingAnimationText = Tween<Offset>(
      begin: const Offset(0, 18),
      end: Offset.zero,
    ).animate(curvedAnimation);

    slidingAnimationImage = Tween<Offset>(
      begin: const Offset(0, -14),
      end: Offset.zero,
    ).animate(curvedAnimation);

    // ✅ لما الأنيميشن يخلص → نروح للصفحة اللي بعدها
    animationController.forward().whenComplete(() {
      if (mounted) {
        Future.delayed(const Duration(seconds: 1), () {
          context.goRoute(AppRouter.login);
        });
      }
    });
  }

}
