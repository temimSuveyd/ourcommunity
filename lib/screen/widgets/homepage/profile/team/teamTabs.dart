import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../controller/teamController.dart';
import '../../../../../core/constant/color.dart';


class TeamTabs extends StatelessWidget {
  final TeamController controller;
  const TeamTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          _buildTab("الإعدادات", 1),
          _buildTab("الأعضاء", 0),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = controller.selectedTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: isSelected ? Appcolor.black : Appcolor.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
