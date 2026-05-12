import 'package:astro/core/common/loading/loading_shimmer.dart';
import 'package:astro/core/common/widjets/custom_container_linear_admin.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/styles/fonts/font_family_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    super.key,
    required this.title,
    required this.number,
    required this.image,
    required this.isLoaidng,
  });

  final String title;
  final String number;
  final String image;
  final bool isLoaidng;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: CustomContainerLinearAdmin(
        height: 120.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  TextApp(
                    text: title,
                    theme: context.textStyle.copyWith(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                    ),
                  ),
                  const Spacer(),
                  if (isLoaidng)
                    LoadingShimmer(
                      height: 30.h,
                      width: 60.w,
                    )
                  else
                    TextApp(
                      text: number,
                      theme: context.textStyle.copyWith(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyHelper.poppinsEnglish,
                      ),
                    ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 90.h,
                child: Image.asset(image),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
