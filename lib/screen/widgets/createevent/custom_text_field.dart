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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: TextStyle(
              color: Appcolor.black,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 6.h),
          TextFormField(
            validator: (value) => validator(value),
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
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
