import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class CustomDividerWidget extends StatelessWidget {
  final double height;
  final double borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final double opacity;

  const CustomDividerWidget({
    super.key,
    this.height = 1.3,
    this.borderRadius = 9,
    this.color,
    this.margin,
    this.opacity = 0.12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 7.h),
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        color: color ?? Appcolor.primarycolor.withOpacity(opacity),
      ),
    );
  }
}
