import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final Color cardsColor;
  final double elevation;

  const CustomIconCard({
    super.key,
    required this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 80,
    this.cardsColor = Colors.white10,
    this.elevation = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: elevation,
      color: cardsColor,
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
