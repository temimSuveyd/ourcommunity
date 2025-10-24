import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/screen/widgets/onboarding/CustomBottomonboarding.dart';
import 'package:ourcommunity/screen/widgets/onboarding/Customcontrollel.dart';
import 'package:ourcommunity/screen/widgets/onboarding/onboardingBody.dart';
import 'package:ourcommunity/screen/widgets/onboarding/onboardingSkipButton.dart';
import 'package:ourcommunity/screen/widgets/onboarding/onboardingSubtitle.dart';
import 'package:ourcommunity/screen/widgets/onboarding/onboardingimage.dart';
import 'package:ourcommunity/screen/widgets/onboarding/onboardingtitle.dart';
import '../../data/dataScore/static/static.dart';
import '../../../../controller/onboarding_page.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingcontrollerImp());

    return Scaffold(
      body: GetBuilder<OnboardingcontrollerImp>(
        builder: (controller) {
          return PageView.builder(
            allowImplicitScrolling: false,
            pageSnapping: true,
            physics: BouncingScrollPhysics(),
            controller: controller.pagecontroller,
            itemCount: onboardinglist.length,
            onPageChanged: (index) {
              controller.currentpage = index;
              controller.update();
            },
            itemBuilder: (context, index) {
              final item = onboardinglist[index];
              return Stack(
                children: [
                  Container(
                    color: item.backgroundColor ?? Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OnboardingImage(imagePath: item.image ?? ""),
                          SizedBox(height: 20.h),
                          Column(
                            children: [
                              OnboardingTitle(
                                  title: item.title ?? "",
                                  color: item.titleColor ?? Colors.grey),
                              SizedBox(height: 10.h),
                              OnboardingSubtitle(
                                  subtitle: item.subtitle ?? "",
                                  color: item.subtitleColor ?? Colors.black),
                              SizedBox(height: 15.h),
                              OnboardingBody(
                                  body: item.body ?? "",
                                  color: item.bodyColor ?? Colors.grey),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Customcontrolleronboarding(
                                  color: item.controllerColor ?? Colors.black),
                              Spacer(),
                              CustomBottomOnboarding(
                                textcolor: item.textbuttonColor ?? Colors.white,
                                color: item.buttonColor ?? Colors.black,
                              ),
                      
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  OnboardingSkipButton(color: item.skipColor ?? Colors.black87),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
