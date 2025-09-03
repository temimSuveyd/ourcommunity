// lib/pages/widgets/login_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  AuthButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          Colors.white.withOpacity(0.13),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.yellow.shade200,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
          ),
        ),
      ),
    );
  }
}
