import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;

  const CustomEmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: Appcolor.black,
        fontFamily: "cairo",
      ),
      decoration: InputDecoration(
        hintText: "email@example.com",
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: Appcolor.grey,
          fontFamily: "cairo",
        ),
        filled: true,
        fillColor: Appcolor.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Appcolor.primarycolor, width: 2),
        ),
      ),
    );
  }
}
