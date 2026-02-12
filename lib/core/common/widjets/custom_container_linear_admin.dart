import 'package:astro/core/styles/colors/colors_dark.dart';
import 'package:flutter/material.dart';

class CustomContainerLinearAdmin extends StatelessWidget {
  const CustomContainerLinearAdmin({
    required this.height,
    required this.width,
    required this.child,
    super.key,
  });

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            ColorsDark.black1.withOpacity(0.8),
            ColorsDark.black2.withOpacity(0.9),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
      ),
      child: child,
    );
  }
}
