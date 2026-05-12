import 'package:astro/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  const CustomBottomSheet._();

  static Future showModelBottomSheetContainer({
    required BuildContext context,
    required Widget widjet,
    Color? backgroundColor,
    VoidCallback? whenComplete,
  }) {
    return showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      backgroundColor: backgroundColor ?? context.color.bluePinkDark,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(
                context,
              ).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: widjet,
            ),
          ),
        );
      },
    ).whenComplete(whenComplete ?? () {});
  }
}
