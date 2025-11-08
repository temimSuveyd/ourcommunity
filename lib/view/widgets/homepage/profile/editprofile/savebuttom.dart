import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/color.dart';


class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const SaveButton({
    super.key,
    required this.onPressed,
    this.label = 'Save Changes',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.primarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          shadowColor: Appcolor.primarycolor.withOpacity(0.4),
          elevation: 5,
        ),
        onPressed: onPressed,
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
