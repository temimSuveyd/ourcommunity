import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/color.dart';


class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const SaveButton({
    super.key,
    required this.onPressed,
    this.label = "حفظ التغييرات",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.primarycolor,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          shadowColor: Appcolor.primarycolor.withOpacity(0.4),
          elevation: 5,
        ),
        onPressed: onPressed,
        icon: Icon(Icons.save, color: Colors.white),
        label: Text(
          label,
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
