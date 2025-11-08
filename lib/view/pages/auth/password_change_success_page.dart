import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';
import '../../widgets/auth/authheader.dart';

class PasswordChangeSuccessPage extends StatelessWidget {
  const PasswordChangeSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// AuthHeader في الأعلى
              AuthHeader(
                title: "password_changed_title".tr,
                subtitle: "password_changed_message".tr,
                titleColor:Appcolor.primarycolor,
                subtitleColor: Appcolor.black,

              ),

              SizedBox(height: 30.h),

              /// صورة النجاح
              Image.asset(
                'asset/images/successrepasswordimage.png',
                height: 200.h,
              ),

              SizedBox(height: 40.h),

              /// زر العودة لتسجيل الدخول
              /// النص بعد الصورة
              Center(
                  child: Text(
                      "successfully. You can now log in with your new password.".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))),
              SizedBox(height: 20.h),

            ],
          ),
        ),
      ),
    );
  }
}
