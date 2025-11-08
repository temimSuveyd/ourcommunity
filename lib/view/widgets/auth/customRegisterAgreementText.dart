import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/color.dart';

class CustomRegisterAgreementText extends StatelessWidget {
  const CustomRegisterAgreementText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text: "By clicking the ",
        style: TextStyle(
          fontSize: 14.sp,
          color: Appcolor.grey,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: "Register",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14.sp,
            ),
          ),
          TextSpan(
            text: " button, you agree to the public offer",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
