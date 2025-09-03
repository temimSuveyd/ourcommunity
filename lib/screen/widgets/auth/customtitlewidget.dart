import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const CustomTitleWidget({
    super.key,
    required this.title,
    this.fontSize,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.blueAccent,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 26.sp,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
