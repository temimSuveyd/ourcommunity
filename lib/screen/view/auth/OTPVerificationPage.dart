import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';

import '../../widgets/auth/authbuttom.dart';
import '../../widgets/auth/backgroundimage.dart';
import '../../widgets/auth/customimagewidget.dart';

class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers =
    List.generate(4, (index) => TextEditingController());

    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Background

          BackgroundImageWidget(),
          // ✅ Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ✅ Illustration
                    const CustomImageWidget(imagePath: "asset/images/email.png"),


                    // ✅ Title
                    Text(
                      "Confirm your email address",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // ✅ Subtitle
                    Text(
                      "We sent a 4-digit code to:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5.h),

                    // ✅ User email
                    Text(
                      "email@gmail.com", // <-- make dynamic later
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),

                    SizedBox(height: 30.h),

                    // ✅ Verify Button
                    CustomAuthButton(label:  "Verify", onPressed: () { Get.toNamed(Approutes.respassword); },),


                    SizedBox(height: 20.h),

                    // ✅ Resend text link
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.snackbar("Info", "Resend OTP clicked",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.orange,
                              colorText: Colors.white);
                        },
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
