import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class EventCardContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final Border? border;

  const EventCardContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.borderRadius = 20,
    this.backgroundColor,
    this.boxShadow,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 9.h, horizontal: 2.w),
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? Appcolor.white,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: border ??
            Border.all(
              color: Appcolor.primarycolor.withOpacity(0.08),
              width: 1.0,
            ),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Appcolor.primarycolor.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 3),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Appcolor.primarycolor.withOpacity(0.04),
                blurRadius: 16,
                offset: const Offset(0, 8),
                spreadRadius: 0,
              ),
            ],
      ),
      child: child,
    );
  }
}
