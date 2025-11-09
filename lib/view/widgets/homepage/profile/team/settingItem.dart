import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';


class SettingItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final IconData icon;
  final Function() onPressed;
  final bool isPrimary;
  final Color color;

  const SettingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.icon,
    required this.onPressed,
    required this.isPrimary, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Appcolor.cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Appcolor.grey,width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color:color , size: 28.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Appcolor.primarTextcolor)),
                SizedBox(height: 4.h),
                Text(subtitle,
                    style: TextStyle(
                        color: Appcolor.secondTextcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp)),
                SizedBox(height: 12.h),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPrimary ? color : Colors.white,
                    foregroundColor: isPrimary ? Colors.white : color,
                    side:  BorderSide(color: color, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 15.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
