import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;
  final String label;
  final double top;
  final double left;

  const CustomBackButton({
    super.key,
    this.color = Colors.white,
    this.label = "Back",
    this.top = 50,
    this.left = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.arrow_back_ios_new_outlined, color: color, size: 18.sp),
            SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 18.sp,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
