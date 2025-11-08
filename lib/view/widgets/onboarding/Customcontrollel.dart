
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constant/color.dart';
import '../../../data/dataScore/static/static.dart';
import '../../../controller/on_boarding_page_controller.dart';




class Customcontrolleronboarding extends StatelessWidget {
final  Color color;
   const Customcontrolleronboarding({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnboardingcontrollerImp>(builder: (controller)=>  SmoothPageIndicator(
      controller: controller.pagecontroller,
      count: onboardinglist.length,
      effect: ExpandingDotsEffect(
        activeDotColor: color,
        dotColor: Colors.grey.shade400,
        dotHeight: 8.h,
        dotWidth: 8.w,
        expansionFactor: 4,
      ),
    ),);
  }
}
