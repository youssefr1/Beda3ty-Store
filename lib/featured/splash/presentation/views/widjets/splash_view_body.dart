import 'package:animate_do/animate_do.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/services/shared_pref/pref_keys.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;

      final token = SharedPref().getString(PrefKeys.accessToken) ?? '';
      final role = SharedPref().getString(PrefKeys.userRole) ?? '';

      if (token.isNotEmpty) {
        if (role.toLowerCase() == 'admin') {
          context.go(AppRouter.homeAdmin);
        } else {
          context.go(AppRouter.homeCustomer);
        }
      } else {
        context.go(AppRouter.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Background: Deep navy blue radial gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Color(0xFF1B264F), // Lighter Navy
                  Color(0xFF0B1026), // Deep Navy
                ],
              ),
            ),
          ),

          // 2. Center Content: Glowing rings, Logo, and Icons
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Concentric, subtle glowing rings
                    const _GlowingRings(),
                    
                    // Metallic silver logo text 'SOOQLY' and shopping cart icon
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ZoomIn(
                          duration: const Duration(seconds: 2),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            size: 60.sp,
                            color: const Color(0xFFE5E7E9), // Metallic Silver
                          ),
                        ),
                        SizedBox(height: 10.h),
                        FadeInDown(
                          duration: const Duration(seconds: 1),
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                Color(0xFFBDC3C7),
                                Color(0xFFE5E7E9),
                                Color(0xFFBDC3C7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: Text(
                              'SOOQLY',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 48.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 12.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 40.h),

                // 3. Tagline: Gold serif font with significant letter spacing
                FadeInUp(
                  delay: const Duration(milliseconds: 500),
                  child: Text(
                    'EXPERIENCE PREMIUM SHOPPING',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFC5A059), // Premium Gold
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 6.0,
                      fontFamily: 'Serif',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 4. Bottom: Segmented loading bar and Glossy Finish
          Positioned(
            bottom: 80.h,
            left: 50.w,
            right: 50.w,
            child: FadeIn(
              delay: const Duration(milliseconds: 1000),
              child: Column(
                children: [
                  const _SegmentedLoadingBar(),
                  SizedBox(height: 16.h),
                  Text(
                    'Loading your experience...',
                    style: TextStyle(
                      color: Colors.white30,
                      fontSize: 11.sp,
                      fontFamily: 'Serif',
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Custom Glowing Rings ───────────────────────────────────────────────────
class _GlowingRings extends StatefulWidget {
  const _GlowingRings();

  @override
  State<_GlowingRings> createState() => _GlowingRingsState();
}

class _GlowingRingsState extends State<_GlowingRings>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(280.w, 280.w),
          painter: _RingsPainter(_controller.value),
        );
      },
    );
  }
}

class _RingsPainter extends CustomPainter {
  final double progress;
  _RingsPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (int i = 1; i <= 3; i++) {
      final radius = (size.width / 2) * (i / 3) * (0.8 + 0.2 * progress);
      paint.color = const Color(0xFF6C63FF).withOpacity(0.1 * (1 - progress));
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(_RingsPainter oldDelegate) => true;
}

// ─── Custom Segmented Loading Bar ───────────────────────────────────────────
class _SegmentedLoadingBar extends StatefulWidget {
  const _SegmentedLoadingBar();

  @override
  State<_SegmentedLoadingBar> createState() => _SegmentedLoadingBarState();
}

class _SegmentedLoadingBarState extends State<_SegmentedLoadingBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: 6.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: CustomPaint(
            painter: _SegmentedPainter(_controller.value),
          ),
        );
      },
    );
  }
}

class _SegmentedPainter extends CustomPainter {
  final double progress;
  _SegmentedPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFC5A059),
          Color(0xFFE5C185),
          Color(0xFFC5A059),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final segmentWidth = size.width / 10;
    final currentWidth = size.width * progress;

    for (int i = 0; i < 10; i++) {
      if (i * segmentWidth < currentWidth) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(i * segmentWidth + 2, 0, segmentWidth - 4, size.height),
            const Radius.circular(2),
          ),
          paint,
        );
      }
    }

    // Glossy overlay
    final glossyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withOpacity(0.3),
          Colors.transparent,
          Colors.white.withOpacity(0.1),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), glossyPaint);
  }

  @override
  bool shouldRepaint(_SegmentedPainter oldDelegate) => true;
}
