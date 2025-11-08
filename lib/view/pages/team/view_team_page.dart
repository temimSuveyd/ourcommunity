import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/team/team_view_controller.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import 'package:ourcommunity/view/widgets/homepage/profile/team/membersSection.dart';
import 'package:ourcommunity/view/widgets/homepage/profile/team/settingsSection.dart';
import 'package:ourcommunity/view/widgets/homepage/profile/team/teamTabs.dart';
import '../../widgets/homepage/profile/team/teamHeader.dart';

class TeamViewPage extends GetView<TeamViewControllerImp> {
  const TeamViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => TeamViewControllerImp(),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        controller.teamModel!.teamName!,
        () => controller.backToLastPage(controller.teamModel!),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 🔹 الغلاف
            const TeamHeader(),

            SizedBox(height: 16.h),

            /// 🔹 Tabs
            TeamTabs(),

            SizedBox(height: 20.h),

            /// 🔹 المحتوى

            GetBuilder<TeamViewControllerImp>(
              builder: (controller) {
                if (controller.selectedTap == 1) {
                  return SettingsSection();
                } else {
                  return MembersSection();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

}
