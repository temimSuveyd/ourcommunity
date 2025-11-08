
//
// ✅ أزرار المشاركة والإبلاغ
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventFooterActions extends StatelessWidget {
  const EventFooterActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.blue.shade200, width: 1),
          ),
          child: TextButton.icon(
            onPressed: () {
              Get.snackbar("Share", "Event shared successfully");
            },
            icon: Icon(Icons.share, color: Colors.blue.shade700, size: 18.sp),
            label: Text(
              "Share",
              style: TextStyle(
                color: Colors.blue.shade700,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "cairo",
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.red.shade200, width: 1),
          ),
          child: TextButton.icon(
            onPressed: () {
              Get.snackbar("Report", "Event report sent successfully");
            },
            icon: Icon(Icons.flag, color: Colors.red.shade700, size: 18.sp),
            label: Text(
              "Report",
              style: TextStyle(
                color: Colors.red.shade700,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "cairo",
              ),
            ),
          ),
        ),
      ],
    );
  }
}