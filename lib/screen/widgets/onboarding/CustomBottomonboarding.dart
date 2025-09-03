import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';

import '../../../controller/onboarding_page.dart';
import '../../../../data/static/static.dart'; // علشان onboardinglist

class CustomBottomOnboarding extends GetView<OnboardingcontrollerImp> {

  final  Color color;
  final Color textcolor;
  final Function() onPressed;

 const CustomBottomOnboarding( {super.key, required this.color,required this.textcolor , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingcontrollerImp>(
      builder: (controller) {
        return SizedBox(
          // margin: EdgeInsets.only(bottom: 5.h, left: 20.w, right: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          // فراغ بدل الزر

              // زر Next أو Get Started
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: color,
                  shape: const CircleBorder(), // شكل دايرة
                  padding: EdgeInsets.all(24), // علشان تبقى الدائرة كبيرة
                ),
                onPressed: () {
                  onPressed();
           
                },
                child: Text(
                  "Next".tr,
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
