import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';

Widget buildHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("أنت تحجز ل",
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              fontFamily: "cairo")),
      SizedBox(height: 4.h),
      Text(
        "بطولة كرة قدم شبابية",
        style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Appcolor.black,
            fontFamily: "cairo"),
      ),
      SizedBox(height: 20.h),
      Row(
        children: [
          Icon(Icons.confirmation_number, color: Colors.blue, size: 22.sp),
          SizedBox(width: 6.w),
          Text("اختر تذاكرك",
              style: TextStyle(
                  color: Appcolor.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "cairo")),
        ],
      ),
    ],
  );
}

