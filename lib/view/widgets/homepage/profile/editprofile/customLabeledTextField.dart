import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/color.dart';

class CustomLabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final Function(String?) validator;

  const CustomLabeledTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Appcolor.secondTextcolor,
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 50,
          child: TextFormField(
            validator: (value) => validator(value),
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Appcolor.grey,
            ),
            cursorColor: Appcolor.grey,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Appcolor.grey,size: 24,),
              filled: true,
              fillColor: Appcolor.backgroundColor,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Appcolor.grey, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Appcolor.grey, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Appcolor.primarycolor, width: 0.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.red, width: 0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
