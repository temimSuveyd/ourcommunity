import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';

class SetDateRange extends StatelessWidget {
  const SetDateRange({
    super.key,
    required this.onsetStartDate,
    required this.onsetEndDate,
    required this.startDate,
    required this.endDateDate,
  });
  final Function() onsetStartDate;
  final Function() onsetEndDate;
  final DateTime startDate;
  final DateTime endDateDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () => onsetStartDate(),
          child: Container(
              width: Get.width / 2 - 27,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
              decoration: BoxDecoration(
                border: Border.all(color: Appcolor.grey, width: 1.5),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Text(
                "From: ${startDate.day}/${startDate.month}/${startDate.year}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "cairo",
                  color: Appcolor.black,
                ),
              )),
        ),
        SizedBox(width: 10.w),
        // نهاية التاريخ
        GestureDetector(
          onTap: () => onsetEndDate(),
          child: Container(
              width: Get.width / 2 - 27,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w),
              decoration: BoxDecoration(
                border: Border.all(color: Appcolor.grey, width: 1.5),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Text(
                "To: ${endDateDate.day}/${endDateDate.month}/${endDateDate.year}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "cairo",
                  color: Appcolor.black,
                ),
              )),
        ),
      ],
    );
  }
}
