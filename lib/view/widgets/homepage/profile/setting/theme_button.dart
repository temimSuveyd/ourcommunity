import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ourcommunity/controller/settings/settings_controller.dart';
import 'package:ourcommunity/core/constant/color.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Appcolor.cardColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.dark_mode, color: Appcolor.primarycolor, size: 27),
          SizedBox(width: 13.w),
          Expanded(
            child: Text(
              "Activate night mode",
              style: TextStyle(
                fontSize: 16.5.sp,
                color: Appcolor.primarycolor,
                fontWeight: FontWeight.bold,
                fontFamily: "cairo",
              ),
            ),
          ),
          // Not: burada gerçek dark mode toggle için state management gerekir
          GetBuilder<SettingsControllerImp>(
            builder: (controller) => Switch.adaptive(
              value: controller.isDarkMode!,
              onChanged: (val) {
                controller.chooseDarkMode();
              },
              activeColor: Appcolor.primarycolor,
              inactiveThumbColor: Colors.grey.shade400,
              inactiveTrackColor: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
