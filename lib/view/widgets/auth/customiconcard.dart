import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final Color backgroundColor;
  final double elevation;

  const CustomIconCard({
    super.key,
    required this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 80,
    this.backgroundColor = Colors.white10,
    this.elevation = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: elevation,
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
