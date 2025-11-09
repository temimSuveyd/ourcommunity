import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboard;
  final Function(String?) validator;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.hint,
    required this.controller,
    required this.keyboard,
    required this.validator,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value),
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboard,
      style: TextStyle(
          color: Appcolor.primarTextcolor,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          fontFamily: "cairo"),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            color: Appcolor.secondTextcolor,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            fontFamily: "cairo"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Appcolor.grey.withOpacity(0.3), width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolor.primarycolor, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }
}
