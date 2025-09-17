import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/featured/auth/presentation/widjets/auth_custom_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigatorBar extends StatelessWidget {
  const BottomNavigatorBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(
        MediaQuery.of(context).size.width, 100.h
      ),
      painter: AuthCustomPainter(
        gradient: LinearGradient(
          colors: [
            context.color.bluePinkLight!,
            context.color.bluePinkLight!,
            context.color.bluePinkLight!,
            context.color.bluePinkDark!,
          ],
        ),
      ),
    );
  }
}
