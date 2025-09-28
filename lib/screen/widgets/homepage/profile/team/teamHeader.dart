import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';


class TeamHeader extends StatelessWidget {
  const TeamHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundImage: const NetworkImage(
              "https://via.placeholder.com/150",
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            "قراء الدسمة",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Appcolor.black,
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "نادي قراء لمناقشة الكتب والروايات",
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
