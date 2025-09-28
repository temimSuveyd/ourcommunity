import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';
import '../../../../view/profile/verifyIdentityPage.dart';
import 'dashedBorderPainter.dart';

class CivilIdField extends StatelessWidget {
  final TextEditingController controller;

  const CivilIdField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الرقم المدني",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
            color: Appcolor.black,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CustomPaint(
            painter: DashedBorderPainter(
              color: Colors.grey.shade500,
              radius: 12.r,
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                hintText: "أدخل الرقم المدني",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "cairo",
                  color: Appcolor.grey2,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
