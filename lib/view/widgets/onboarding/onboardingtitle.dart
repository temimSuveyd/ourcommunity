import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingTitle extends StatelessWidget {
  final String title;
  final Color color;

  const OnboardingTitle({
    super.key,
    required this.title,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: "cairo",
      ),
    );
  }
}
