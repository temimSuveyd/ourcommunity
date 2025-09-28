
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';

/// TextField
Widget buildTextField(String label,
    String hint,
    TextEditingController controller, {
      int maxLines = 1,
      TextInputType keyboard = TextInputType.text,
    }) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                color: Appcolor.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                fontFamily: "cairo")),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboard,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                color: Appcolor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                fontFamily: "cairo"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Appcolor.grey, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Appcolor.grey, width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    ),
  );
}

