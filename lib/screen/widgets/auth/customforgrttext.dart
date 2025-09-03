import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/Approutes.dart';

class ForgotPasswordLink extends StatelessWidget {
  final Alignment alignment;
  final Color color;

  const ForgotPasswordLink({
    super.key,
    this.alignment = Alignment.centerRight,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: GestureDetector(
        onTap: () => Get.toNamed(Approutes.forgetpasswordpage),
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
