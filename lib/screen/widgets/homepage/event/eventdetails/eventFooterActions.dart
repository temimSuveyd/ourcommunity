
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            onPressed: () {
              Get.snackbar("مشاركة", "تمت مشاركة الفعالية");
            },
            icon: const Icon(Icons.share, color: Colors.grey),
            label: Text(
              "مشاركة",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15.sp,
                  fontFamily: "cairo"),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Get.snackbar("إبلاغ", "تم إرسال بلاغ عن الفعالية");
            },
            icon: const Icon(Icons.flag, color: Colors.grey),
            label: Text(
              "إبلاغ",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 15.sp,
                  fontFamily: "cairo"),
            ),
          ),
        ],
      ),
    );
  }
}