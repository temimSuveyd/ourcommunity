import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../data/dataScore/static/static.dart';
import '../../../controller/on_boarding_page_controller.dart';
import 'CustomBottomonboarding.dart';
import 'Customcontrollel.dart';

class OnboardingCustomSlider extends GetView<OnboardingcontrollerImp> {
  const OnboardingCustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pagecontroller,
      itemCount: onboardinglist.length,
      onPageChanged: (index) {
        // controller.currentpage.value = index;
      },
      itemBuilder: (context, index) {
        final item = onboardinglist[index];
        return Container(
          color: item.backgroundColor ?? Colors.white, // ✅ خلفية الصفحة
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🖼️ الصورة
              Expanded(
                flex: 5,
                child: Image.asset(
                  item.image ?? "",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 30.h),

              // 🔹 العنوان الرمادي (title)
              Text(
                item.title ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontFamily: "cairo",
                ),
              ),

              SizedBox(height: 8.h),

              // 🔹 العنوان الغامق الأسود (subtitle)
              Text(
                item.subtitle ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "cairo",
                ),
              ),

              SizedBox(height: 15.h),

              // 🔹 النص الوصفي (body)
              Text(
                item.body ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[600],
                  fontFamily: "cairo",
                  height: 1.5,
                ),
              ),
          // 🔹 الكنترول + زر Next
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Customcontrolleronboarding(color: Colors.black,),
              SizedBox(width: 100.w),
              CustomBottomOnboarding(color: Colors.black, textcolor: Colors.white,),
            ],
          ),
       ] ));
      },
    );
  }
}
