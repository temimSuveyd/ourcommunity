import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class KeepLoggedInRow extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onForgotPassword;

  const KeepLoggedInRow({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Keep me logged in
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: onChanged,
              checkColor: Colors.white,
              activeColor: Colors.blue,
            ),
            Text(
              "Keep me logged in",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),

        /// Forgot Password
        GestureDetector(
          onTap: onForgotPassword,
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              fontSize: 13.sp,
              color: Appcolor.primarycolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
