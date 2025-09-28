import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/screen/widgets/homepage/profile/team/settingItem.dart';

import '../../../../../core/constant/Approutes.dart';
import '../../../../view/homepage/teamVerificationPage.dart';


class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingItem(
          title: "تعديل معلومات الفريق",
          subtitle: "قم بتغيير اسم الفريق، الشعار، القواعد، والمزيد.",
          buttonText: "تعديل المعلومات",
          icon: Icons.settings,
          isPrimary: true,
          onPressed: () => Get.toNamed(Approutes.editTeamInfoPage),
        ),
        SettingItem(
          title: "توثيق الفريق",
          subtitle: "توثيق فريقك يمنحه علامة تحقق ويزيد من موثوقيته.",
          buttonText: "توثيق الفريق الآن",
          icon: Icons.verified,
          isPrimary: false,
          onPressed: () => Get.to(() => const TeamVerificationPage(),
              arguments: {"teamName": "الفريق الذهبي"}),
        ),
        /// 🔹 منطقة الخطر
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.red.shade300, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.delete_outline_outlined, color: Colors.red),
                  SizedBox(width: 6.w),
                  Text(
                    "منطقة الخطر",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                "حذف الفريق إجراء دائم ولا يمكن التراجع عنه.",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  "حذف الفريق",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
