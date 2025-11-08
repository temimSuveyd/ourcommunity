import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';

import '../../../core/constant/color.dart';
import '../../widgets/homepage/profile/verifyidentity/civilIdField.dart';
import '../../widgets/homepage/profile/verifyidentity/uploadCardWidget.dart';
import '../../widgets/homepage/profile/verifyidentity/primaryButton.dart';

class VerifyIdentityPage extends StatelessWidget {
  const VerifyIdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Identity Verification', () => Get.back(),),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            SizedBox(height: 20.h),
            _buildFormContainer(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
  /// ✅ الهيدر (الأيقونة + العنوان + النص التوضيحي)
  Widget _buildHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundColor: Appcolor.primarycolor.withOpacity(0.1),
          child: Icon(
            Icons.verified_user,
            color: Appcolor.primarycolor,
            size: 40.sp,
          ),
        ),
        SizedBox(height: 12.h),

        Text(
          "Civil ID Verification",
          style: TextStyle(
            fontSize: 22.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.bold,
            color: Appcolor.black,
          ),
        ),
        SizedBox(height: 8.h),

        Text(
          "Verify your identity by entering your civil ID number and uploading your civil ID card photo to verify your identity and enjoy app benefits.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.bold,
            color: Appcolor.grey2,
          ),
        ),
      ],
    );
  }

  /// ✅ الكونتينر الخاص بالفورم
  Widget _buildFormContainer() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CivilIdField(controller: TextEditingController(),),
          SizedBox(height: 20.h),

          UploadCardWidget(title: 'Civil ID Card Photo (Front Side)', onTap: () {  },),
          SizedBox(height: 20.h),

          Text(
            "All information is handled with complete confidentiality.",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "cairo",
              color: Appcolor.grey2,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.h),

          PrimaryButton(text: 'Send for Verification', onPressed: () {  },),
        ],
      ),
    );
  }
}
