
//
// ✅ أزرار الحجز والحفظ
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constant/Approutes.dart';
import '../../../../../core/constant/color.dart';

class EventActionButtons extends StatelessWidget {
  const EventActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.primarycolor,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.ticketBookingPage);
              },
              child: Text(
                "حجز التذكرة",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Appcolor.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "cairo",
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                side: BorderSide(color: Appcolor.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {
                Get.snackbar("تم", "تم حفظ التذكرة في المفضلة");
              },
              icon: Icon(Iconsax.heart4, color: Appcolor.black),
              label: Text(
                "حفظ",
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Appcolor.grey2,
                  fontWeight: FontWeight.bold,
                  fontFamily: "cairo",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
