import 'package:astro/core/common/animation/animate_do.dart';
import 'package:astro/core/common/widjets/custom_linear_button.dart';
import 'package:astro/core/common/widjets/show_toast.dart';
import 'package:astro/core/common/widjets/text_app.dart';
import 'package:astro/core/extensions/context_extensions.dart';
import 'package:astro/core/language/lang_keys.dart';
import 'package:astro/core/routes/app_routes.dart';
import 'package:astro/core/styles/colors/colors_light.dart';
import 'package:astro/core/styles/fonts/font_weight_helper.dart';
import 'package:astro/featured/auth/presentation/view_models/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (userRole) {
            ShowToast.showToastSuccessTop(

              message: context.translate(
                LangKeys.loggedSuccessfully,
              ),
            );
            if (userRole == 'admin') {
              context.pushRoute(AppRouter.homeAdmin);
            } else {
              context.pushRoute(AppRouter.homeCustomer);
            }
          },
          failure: (message) {
            ShowToast.showToastErrorTop(

              message: context.translate(message),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return CustomFadeInDown(
              duration: 500,
              child: CustomLinearButton(
                width: MediaQuery.of(context).size.width,
                onPressed: () {},
                child: const CircularProgressIndicator(
                  color: ColorsLight.mainColor,
                ),
              ),
            );
          },
          orElse: () {
            return CustomFadeInDown(
              duration: 500,
              child: CustomLinearButton(
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  if (context.read<AuthBloc>().formKey.currentState!.validate())
                  {
                    context.read<AuthBloc>().add(
                      AuthEvent.login(),
                    );
                  }
                },
                child: TextApp(
                  text: context.translate(LangKeys.login),
                  theme: context.textStyle.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
