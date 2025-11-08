import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class EventDescriptionWidget extends StatelessWidget {
  final String? description;
  final int maxLines;
  final TextOverflow overflow;

  const EventDescriptionWidget({
    super.key,
    this.description,
    this.maxLines = 3,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    if (description == null || description!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Appcolor.primarycolor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Appcolor.primarycolor.withOpacity(0.08),
          width: 0.5,
        ),
      ),
      child: Text(
        description!,
        style: TextStyle(
          color: Appcolor.primarycolor.withOpacity(0.75),
          fontSize: 13.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.04,
          height: 1.4,
        ),
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
