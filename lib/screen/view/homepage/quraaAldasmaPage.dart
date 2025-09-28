import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/teamController.dart';
import '../../../core/constant/color.dart';
import '../../widgets/homepage/profile/team/membersSection.dart';
import '../../widgets/homepage/profile/team/settingsSection.dart';
import '../../widgets/homepage/profile/team/teamHeader.dart';
import '../../widgets/homepage/profile/team/teamTabs.dart';


class QuraaAldasmaPage extends StatelessWidget {
  const QuraaAldasmaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TeamController controller = Get.put(TeamController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "قراء الدسمة",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Appcolor.black,
            fontSize: 22.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 🔹 الغلاف
              const TeamHeader(),

              SizedBox(height: 16.h),

              /// 🔹 Tabs
              TeamTabs(controller: controller),

              SizedBox(height: 20.h),

              /// 🔹 المحتوى
              controller.selectedTab.value == 0
                  ? MembersSection(controller: controller)
                  : const SettingsSection(),
            ],
          );
        }),
      ),
    );
  }
}
