import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/color.dart';
import '../../widgets/homepage/profile/verifyidentity/civilIdField.dart';
import '../../widgets/homepage/profile/verifyidentity/uploadCardWidget.dart';
import '../../widgets/homepage/profile/verifyidentity/primaryButton.dart';

class VerifyIdentityPage extends StatelessWidget {
  const VerifyIdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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

  /// ✅ AppBar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        "توثيق الهوية",
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: "cairo",
          fontWeight: FontWeight.bold,
          color: Appcolor.black,
        ),
      ),
      centerTitle: true,
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
          "توثيق الهوية المدنية",
          style: TextStyle(
            fontSize: 22.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.bold,
            color: Appcolor.black,
          ),
        ),
        SizedBox(height: 8.h),

        Text(
          "قم بتوثيق هويتك عن طريق إدخال الرقم المدني وإرفاق صورة البطاقة المدنية للتحقق من هويتك والاستمتاع بمزايا التطبيق.",
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

          UploadCardWidget(title: 'صوره البطاقه المدنيه(الوجه الامامي)', onTap: () {  },),
          SizedBox(height: 20.h),

          Text(
            "يتم التعامل مع جميع المعلومات بسرية تامة.",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "cairo",
              color: Appcolor.grey2,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.h),

          PrimaryButton(text: 'ارسال للتحقق', onPressed: () {  },),
        ],
      ),
    );
  }
}
