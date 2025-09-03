import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBody extends StatelessWidget {
  final String body;
  final Color color;

  const OnboardingBody({
    super.key,
    required this.body,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: color,
        fontFamily: "cairo",
        height: 1.5,
      ),
    );
  }
}
