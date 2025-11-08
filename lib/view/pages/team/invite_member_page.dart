import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';

import '../../widgets/homepage/profile/inviteteam/customEmailField.dart';
import '../../widgets/homepage/profile/inviteteam/customPrimaryButton.dart';


class InviteMemberPage extends StatelessWidget {
  const InviteMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar('Invite New Member', () => Get.back()),
      backgroundColor: Appcolor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Appcolor.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: Appcolor.primarycolor.withOpacity(0.1),
                child: Icon(
                  Icons.person_add,
                  color: Appcolor.primarycolor,
                  size: 30.r,
                ),
              ),
              SizedBox(height: 12.h),

              Text(
                "Invite New Member",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.black,
                  fontFamily: "cairo",
                ),
              ),
              SizedBox(height: 8.h),

              Text(
                "Enter the email address of the person you want to invite to join.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.grey,
                  fontFamily: "cairo",
                ),
              ),
              SizedBox(height: 20.h),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Member Email Address",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.black,
                    fontFamily: "cairo",
                  ),
                ),
              ),
              SizedBox(height: 6.h),

              /// ✅ ويدجيت مستقلة لحقل الإيميل
              CustomEmailField(controller: emailController),

              SizedBox(height: 20.h),

              /// ✅ ويدجيت مستقلة للزر الأساسي
              CustomPrimaryButton(
                text: "Send Invitation",
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter email address")),
                    );
                  } else {
                    // TODO: استدعاء API أو الدالة
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
