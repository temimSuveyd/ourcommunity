import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class EventTitleWidget extends StatelessWidget {
  final String title;
  final int maxLines;
  final TextOverflow overflow;

  const EventTitleWidget({
    super.key,
    required this.title,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.isNotEmpty ? title : "Etkinlik Başlığı",
      style: TextStyle(
        color: Appcolor.primarycolor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.08,
        height: 1.3,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
