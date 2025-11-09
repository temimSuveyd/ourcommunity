// ✅ عن الفعالية
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';

class EventDescription extends StatelessWidget {
  final EventModel eventModel;
  const EventDescription({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: Appcolor.primarycolor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(Icons.info_outline, size: 16.sp, color: Appcolor.primarycolor),
            ),
            SizedBox(width: 8.w),
            Text(
              "About the Event",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Appcolor.primarTextcolor,
                fontFamily: "cairo",
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          eventModel.description!,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Appcolor.secondTextcolor,
            height: 1.6,
            fontFamily: "cairo",
          ),
        ),
      ],
    );
  }
}
