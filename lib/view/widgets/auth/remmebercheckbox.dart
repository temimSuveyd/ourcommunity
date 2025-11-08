import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';

class RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final VoidCallback onChanged;

  const RememberMeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Transform.scale(
            scale: 1.2, // تكبير الـ checkbox
            child: Checkbox(
              value: value,
              onChanged: (_) => onChanged(),
              activeColor: Appcolor.primarycolor,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            "Remember Me".tr,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "cairo",
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              letterSpacing: 0.5,
            ),
          ),
        ],

    );
  }
}
