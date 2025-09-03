import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final List<TextEditingController> otpControllers =
  List.generate(4, (index) => TextEditingController());

  void verifyOTP() {
    String otp = otpControllers.map((c) => c.text).join();
    if (otp.length == 4) {
      print("OTP Verified: $otp");
      // أكشن التحقق
    } else {
      Get.snackbar("Error", "Please enter all 4 digits");
    }
  }

  void resendOTP() {
    print("OTP resent");
    // أكشن إرسال الرمز مرة أخرى
  }
}
