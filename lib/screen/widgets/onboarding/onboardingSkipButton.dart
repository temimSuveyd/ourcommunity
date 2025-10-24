import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constant/Approutes.dart';

class OnboardingSkipButton extends StatelessWidget {
  final Color color;

  const OnboardingSkipButton({super.key, this.color = Colors.black87});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.h,
      right: 25.w,
      child: GestureDetector(
        onTap: () {
          Get.offAllNamed(AppRoutes.loginPage);
        },
        child: Text(
          "Skip",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
