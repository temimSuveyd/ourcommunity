// ✅ التاريخ والمكان
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';

import '../../../../../core/constant/color.dart';

class EventInfoRow extends StatelessWidget {
  final EventModel eventModel;
  const EventInfoRow({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.calendar_today, size: 18.sp, color: Colors.blue.shade700),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontFamily: "cairo",
                    ),
                  ),
                  Text(
                    eventModel.startDate!,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontFamily: "cairo",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Appcolor.primarycolor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.location_on, size: 18.sp, color: Appcolor.primarycolor),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      fontFamily: "cairo",
                    ),
                  ),
                  Text(
                    "${eventModel.city} / ${eventModel.governorate}",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontFamily: "cairo",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
