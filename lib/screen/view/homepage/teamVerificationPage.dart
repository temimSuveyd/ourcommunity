import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';
import '../../../controller/profile/teamVerificationController.dart';

class TeamVerificationPage extends StatelessWidget {
  const TeamVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String teamName = Get.arguments?['teamName'] ?? "فريقي";
    final TeamVerificationController controller =
    Get.put(TeamVerificationController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "توثيق فريق $teamName",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerificationHeader(),
              SizedBox(height: 16.h),
              const VerificationInfo(),
              SizedBox(height: 24.h),
              FileUploadCard(controller: controller),
              SizedBox(height: 24.h),
              const Text(
                "سيتم مراجعة المستند من قبل فريقنا.",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              SubmitButton(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

/// ✅ الهيدر (الأيقونة + العنوان)
class VerificationHeader extends StatelessWidget {
  const VerificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.verified_user, color: Colors.blue, size: 80.sp),
        SizedBox(height: 16.h),
        Text(
          "طلب توثيق الفريق",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

/// ✅ النصوص التوضيحية
class VerificationInfo extends StatelessWidget {
  const VerificationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "لزيادة موثوقية فريقك، يرجى تقديم وثيقة رسمية تثبت هوية الفريق أو المنظم.",
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.grey[700],
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

/// ✅ كارت رفع الملف
class FileUploadCard extends StatelessWidget {
  final TeamVerificationController controller;
  const FileUploadCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => DottedBorder(
            
        // color: Colors.blue,
        // strokeWidth: 1.5,
        // dashPattern: [6, 4],
        // borderType: BorderTween,
        // radius: Radius.circular(12.r),
        child: InkWell(
          onTap: controller.pickFile,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                Text(
                  "مستند إثبات رسمي",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12.h),
                Icon(
                  controller.selectedFile.isEmpty
                      ? Icons.cloud_upload
                      : Icons.insert_drive_file,
                  color: controller.selectedFile.isEmpty
                      ? Colors.blue
                      : Colors.green,
                  size: 40.sp,
                ),
                SizedBox(height: 12.h),
                Text(
                  controller.selectedFile.isEmpty
                      ? "اضغط لاختيار الملف"
                      : controller.selectedFile.value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: controller.selectedFile.isEmpty
                        ? Colors.grey[700]
                        : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "PDF, PNG, JPG حتى 10MB",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ✅ زر الإرسال
class SubmitButton extends StatelessWidget {
  final TeamVerificationController controller;
  const SubmitButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: controller.selectedFile.isEmpty
              ? null
              : controller.submitVerification,
          style: ElevatedButton.styleFrom(
            backgroundColor: Appcolor.primarycolor,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            "إرسال طلب التوثيق",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
