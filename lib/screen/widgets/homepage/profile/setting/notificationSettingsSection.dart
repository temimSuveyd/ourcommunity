
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';

/// 🔹 قسم الإشعارات
class NotificationSettingsSection extends StatelessWidget {
  const NotificationSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الإشعارات",
            style: TextStyle(
              fontSize: 18.sp,
              color: Appcolor.black,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo",
            ),
          ),
          SizedBox(height: 12.h),
          _buildSwitchTile("فعاليات جديدة في منطقتي", true, (val) {}),
          _buildSwitchTile("توصيات مخصصة", true, (val) {}),
          _buildSwitchTile("تنبيهات فرقي", false, (val) {}),
        ],
      ),
    );
  }
  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            color: Appcolor.grey2,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
        ),
      ],
    );
  }
}