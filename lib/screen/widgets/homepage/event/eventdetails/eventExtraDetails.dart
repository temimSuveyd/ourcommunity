// ✅ تفاصيل إضافية
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constant/Approutes.dart';
import '../../../../../core/constant/color.dart';

class EventExtraDetails extends StatelessWidget {
  final Map<String, dynamic> event;
  const EventExtraDetails({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "تفاصيل إضافية",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: "cairo",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
          child: Column(
            children: [
              _buildDetail("السعة", event["capacity"] ?? "غير محدد", Icons.group),
              _buildDetail("الفئة العمرية", event["ageGroup"] ?? "الكل", Icons.cake),
              _buildDetail("الجنس", event["gender"] ?? "الكل", Icons.wc),
              _buildDetail(
                "مجهز بالكراسي المتحركة",
                event["wheelchair"] == true ? "نعم" : "لا",
                Icons.accessible,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetail(String title, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey.shade500, size: 18.sp),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                  fontFamily: "cairo",
                ),
              ),
            ],
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "cairo",
              ),
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

//
// ✅ أزرار الحجز والحفظ
//
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
                Get.toNamed(Approutes.ticketBookingPage);
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