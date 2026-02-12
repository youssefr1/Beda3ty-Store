import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProductImages extends StatelessWidget {
  const CreateProductImages({super.key});

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
        return InkWell(
            onTap: (){},
            child: Container(
              height: 100.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(15),

              ) ,
              child: Icon(Icons.add_a_photo_rounded,size: 50,color: Colors.white,),
            )
        );
      },
    );
  }
}
