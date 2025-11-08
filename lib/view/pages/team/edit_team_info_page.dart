import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import '../../../controller/team/edit_team_info_controller.dart';
import '../../widgets/homepage/profile/editinfoteam/CustomteamTextField.dart';
import '../../widgets/homepage/profile/inviteteam/customPrimaryButton.dart';

class EditTeamInfoPage extends StatelessWidget {
  const EditTeamInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => EditTeamInfoControllerImp(),
    );

    return Scaffold(
      appBar: CustomAppBar('Edit team data', () => Get.back()),
      backgroundColor: Appcolor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // صورة الفريق مع زر الكاميرا
            TeamLogoPicker(),

            SizedBox(height: 24.h),

            // الحقول داخل كونتينر
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: GetBuilder<EditTeamInfoControllerImp>(
                builder: (controller) => HandlingDataView(
                  status: controller.statusR,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomteamTextField(
                        label: "اسم الفريق",
                        controller: controller.nameController,
                      ),
                      SizedBox(height: 16.h),

                      CustomteamTextField(
                        label: "نبذة عن الفريق",
                        controller: controller.descController,
                        maxLines: 3,
                      ),

                      SizedBox(height: 24.h),

                      // ✅ زر الحفظ ويدجيت مستقلة
                      CustomPrimaryButton(
                        text: "حفظ التغييرات",
                        onPressed: () => controller.updateData(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamLogoPicker extends StatelessWidget {
  const TeamLogoPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTeamInfoControllerImp>(
      builder: (controller) => Stack(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundImage: NetworkImage(controller.teamModel!.teamLogo!),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
                backgroundColor: Appcolor.primarycolor,
                radius: 20.r,
                child: IconButton(
                  onPressed: () => controller.pickeImage(),
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
