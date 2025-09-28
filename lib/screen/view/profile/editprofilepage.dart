import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/profile/editProfileController.dart';
import '../../../core/constant/color.dart';
import '../../widgets/homepage/profile/editprofile/customLabeledTextField.dart';
import '../../widgets/homepage/profile/editprofile/profileAvatarPicker.dart';
import '../../widgets/homepage/profile/editprofile/savebuttom.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileController controller = Get.put(EditProfileController());

    return Scaffold(
     // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "تعديل الملف الشخصي",
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.bold,
            color: Appcolor.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            // ✅ الصورة الشخصية
            ProfileAvatarPicker(),

            SizedBox(height: 28.h),

            // ✅ حقول النصوص
            CustomLabeledTextField(
              controller: controller.nameController,
              label: "الاسم بالكامل",
              icon: Icons.person,
            ),
            SizedBox(height: 16.h),

            CustomLabeledTextField(
              controller: controller.emailController,
              label: "البريد الإلكتروني",
              icon: Icons.email,
            ),
            SizedBox(height: 16.h),

            CustomLabeledTextField(
              controller: controller.phoneController,
              label: "رقم الهاتف",
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),

            SizedBox(height: 28.h),

            SaveButton(
              onPressed: () => controller.saveChanges(),
            ),

          ],
        ),
      ),
    );
  }
}
