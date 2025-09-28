// ✅ عن الفعالية
//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDescription extends StatelessWidget {
  final Map<String, dynamic> event;
  const EventDescription({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "عن الفعالية",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: "cairo",
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            event["description"] ?? "لا توجد تفاصيل متاحة عن هذه الفعالية حالياً.",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
              height: 1.4,
              fontFamily: "cairo",
            ),
          ),
        ],
      ),
    );
  }
}
