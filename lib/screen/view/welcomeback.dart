import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/color.dart';

import '../../controller/auth/authcontroller.dart';

class WelcomeBackUI extends StatelessWidget {
  const WelcomeBackUI({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              "asset/images/backgroundimage.png", // غيّري الاسم حسب صورتك
              fit: BoxFit.cover,
            ),
          ),
          // المحتوى
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 50), // مسافة من فوق
              // النص في النص
              Center(
                child: Column(
                  children: [
                    Text(
                      "Welcome Back !",
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 10.h),
                      child: Text(
                        "Enter personal details to your employee account",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              // الأزرار تحت
              Padding(
                padding: EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Sign In Text Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.loginPage);
                          // TODO: Navigation
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),

                    // Sign Up Button (inside white container)
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.registerPage);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(30)),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Appcolor.primarycolor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
