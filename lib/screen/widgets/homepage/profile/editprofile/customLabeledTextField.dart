
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';

/// ✅ ويدجت الحقول المخصصة
class CustomLabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;

  const CustomLabeledTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: "cairo",
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Appcolor.black,
          ),
        ),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(
            fontFamily: "cairo",
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Appcolor.grey2,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Appcolor.primarycolor),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Appcolor.primarycolor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Appcolor.primarycolor, width: 1.8),
            ),
          ),
        ),
      ],
    );
  }
}
