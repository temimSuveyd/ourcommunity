import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';
import '../../../controller/editTeamInfocontroller.dart';
import '../../widgets/homepage/profile/editinfoteam/CustomteamTextField.dart';
import '../../widgets/homepage/profile/inviteteam/customPrimaryButton.dart';


class EditTeamInfoPage extends StatelessWidget {
  EditTeamInfoPage({super.key});

  final Editteaminfocontroller controller = Get.put(Editteaminfocontroller());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController rulesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // تحميل البيانات الأولية
    nameController.text = controller.teamName.value;
    descController.text = controller.teamDescription.value;
    rulesController.text = controller.teamRules.value;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تعديل معلومات الفريق",
          style: TextStyle(
            color: Appcolor.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: Appcolor.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: Appcolor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // صورة الفريق مع زر الكاميرا
            Stack(
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.grey[300],
                  child: Text(
                    "100×100",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Appcolor.primarycolor,
                    radius: 20.r,
                    child: const Icon(Icons.camera_alt, color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(height: 24.h),

            // الحقول داخل كونتينر
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomteamTextField(
                    label: "اسم الفريق",
                    controller: nameController,
                  ),
                  SizedBox(height: 16.h),

                  CustomteamTextField(
                    label: "نبذة عن الفريق",
                    controller: descController,
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.h),

                  CustomteamTextField(
                    label: "قواعد الفريق",
                    controller: rulesController,
                    maxLines: 3,
                  ),
                  SizedBox(height: 24.h),

                  // ✅ زر الحفظ ويدجيت مستقلة
                  CustomPrimaryButton(
                    text: "حفظ التغييرات",
                    onPressed: () {
                      controller.updateTeamInfo(
                        name: nameController.text,
                        desc: descController.text,
                        rules: rulesController.text,
                      );
                      Get.snackbar(
                        "تم الحفظ",
                        "تم تحديث معلومات الفريق بنجاح",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
