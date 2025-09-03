import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingSubtitle extends StatelessWidget {
  final String subtitle;
  final Color color;

  const OnboardingSubtitle({
    super.key,
    required this.subtitle,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: "cairo",
      ),
    );
  }
}
