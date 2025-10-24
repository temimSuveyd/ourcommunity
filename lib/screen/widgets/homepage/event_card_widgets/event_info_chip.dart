import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class EventInfoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;

  const EventInfoChip({
    super.key,
    required this.icon,
    required this.text,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Appcolor.primarycolor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Appcolor.primarycolor.withOpacity(0.12),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16.sp,
            color: iconColor ?? Appcolor.primarycolor.withOpacity(0.7),
          ),
          SizedBox(width: 6.w),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: textColor ?? Appcolor.primarycolor.withOpacity(0.75),
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                letterSpacing: 0.02,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
