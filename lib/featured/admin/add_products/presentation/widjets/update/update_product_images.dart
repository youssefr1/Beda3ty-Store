import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductImages extends StatelessWidget {
  const UpdateProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: 7.h,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: 100.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://i.imgur.com/ZANVnHE.jpeg')),
              )
            ),

            Container(
              height: 100.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Icon(
                  Icons.add_a_photo_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
