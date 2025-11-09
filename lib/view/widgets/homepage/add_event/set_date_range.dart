import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onsetStartDate(),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Appcolor.grey.withOpacity(0.3), width: 1.5),
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.transparent,
                ),
                child: Text(
                  "From: ${startDate.day}/${startDate.month}/${startDate.year}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "cairo",
                    color: Appcolor.secondTextcolor,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: GestureDetector(
            onTap: () => onsetEndDate(),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Appcolor.grey.withOpacity(0.3), width: 1.5),
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.transparent,
                ),
                child: Text(
                  "To: ${endDateDate.day}/${endDateDate.month}/${endDateDate.year}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "cairo",
                    color: Appcolor.secondTextcolor,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
