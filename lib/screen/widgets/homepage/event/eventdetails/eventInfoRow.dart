// ✅ التاريخ والمكان
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';

class EventInfoRow extends StatelessWidget {
  final Map<String, dynamic> event;
  const EventInfoRow({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        children: [
          Icon(Icons.calendar_today, size: 18.sp, color: Colors.blue),
          SizedBox(width: 6.w),
          Text(
            event["date"] ?? "غير محدد",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: "cairo",
            ),
          ),
          SizedBox(width: 40.w),
          Icon(Icons.location_on, size: 18.sp, color: Appcolor.primarycolor),
          SizedBox(width: 6.w),
          Expanded(
            child: Text(
              event["location"] ?? "غير محدد",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: "cairo",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
