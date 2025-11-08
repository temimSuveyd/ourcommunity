import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubtitleWidget extends StatelessWidget {
  final String subtitle;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const CustomSubtitleWidget({
    super.key,
    required this.subtitle,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.color = Colors.blueGrey,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
