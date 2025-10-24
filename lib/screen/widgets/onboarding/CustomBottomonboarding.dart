import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';

import '../../../controller/onboarding_page.dart';
import '../../../data/dataScore/static/static.dart'; // علشان onboardinglist

class CustomBottomOnboarding extends GetView<OnboardingcontrollerImp> {
  final Color color;
  final Color textcolor;
  const CustomBottomOnboarding(
      {super.key, required this.color, required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingcontrollerImp>(
      builder: (controller) {
        return TextButton(
          style: TextButton.styleFrom(
              backgroundColor: color,
              shape: const CircleBorder(), // شكل دايرة
              padding: EdgeInsets.all(0), // علشان تبقى الدائرة كبيرة
              fixedSize: Size(55, 55)),
          onPressed: () {
            if (controller.currentpage == onboardinglist.length - 1) {
              Get.offAllNamed(AppRoutes.welcomeBackUI);
            } else {
              controller.next();
            }
          },
          child: Text(
            "Next".tr,
            style: TextStyle(
              color: textcolor,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
