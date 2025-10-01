import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/services/shared_pref/pref_keys.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:astro/featured/splash/presentation/views/widjets/Sliding_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        const SizedBox(height: 16),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;

      final token = SharedPref().getString(PrefKeys.accessToken) ?? '';
      final role = SharedPref().getString(PrefKeys.userRole) ?? '';

      if (token.isNotEmpty) {
        if (role == 'admin') {
          context.go(AppRouter.homeAdmin);
        } else {
          context.go(AppRouter.homeCustomer);
        }
      } else {
        context.go(AppRouter.login);
      }
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );
    animationController.forward();

    slidingAnimationText = Tween<Offset>(
      begin: const Offset(0, 18),
      end: Offset.zero,
    ).animate(animationController);

    slidingAnimationImage = Tween<Offset>(
      begin: const Offset(0, -14),
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
