import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateCategoryPhoto extends StatelessWidget {
  const UpdateCategoryPhoto({super.key, required this.imageurl});
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(imageurl),
        ),
      ),
    );
  }
}
