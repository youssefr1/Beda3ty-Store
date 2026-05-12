import 'package:astro/core/app/upload_image/cubit/upload_image_cubit.dart';
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ShowToast.showToastSuccessTop(
            message: context.translate(
              LangKeys.loggedSuccessfully,
            ),
          );
          if (state.userRole.toLowerCase() == 'admin') {
            context.goRoute(AppRouter.homeAdmin);
          } else {
            context.goRoute(AppRouter.homeCustomer);
          }
        } else if (state is AuthFailure) {
          ShowToast.showToastErrorTop(message: state.errmessage);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
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
        } else {
          return CustomFadeInDown(
            duration: 500,
            child: CustomLinearButton(
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                _validateThenDoSignUp(context);
              },
              child: TextApp(
                text: context.translate(LangKeys.signUp),
                theme: context.textStyle.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void _validateThenDoSignUp(BuildContext context) {
    final authbloc = context.read<AuthBloc>();
    final imageUplaod = context.read<UploadImageCubit>();

    if (!authbloc.formKey.currentState!.validate() ||
        imageUplaod.getImageUrl.isEmpty) {
      if (imageUplaod.getImageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: context.translate(
            LangKeys.validPickImage,
          ),
        );
      }
    } else {
      context.read<AuthBloc>().add(
        SignUpEvent(imageUrl: imageUplaod.getImageUrl),
      );
    }
  }
}
