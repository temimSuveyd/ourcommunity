import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class TeamFormContainer extends StatelessWidget {
  const TeamFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // أيقونة الفريق
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.blue.withOpacity(0.1),
            child: Icon(Icons.group, size: 40.sp, color: Appcolor.primarycolor),
          ),
          SizedBox(height: 16.h),

          // العنوان
          Text(
            "ابدأ بتكوين مجتمعك",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo",
              color: Appcolor.black,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "أنشئ فريقاً ليجمع أفراد مجتمعك وتنظيم\nالفعاليات والأنشطة المشتركة.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "cairo",
              color: Appcolor.grey2,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.h),

          // الحقول
          _buildFormCard(context),
        ],
      ),
    );
  }

  Widget _buildFormCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Appcolor.white,
        border: Border.all(color: Appcolor.grey),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField("اسم الفريق", "مثال: أسود السالمية"),
          SizedBox(height: 16.h),
          _buildTextField("نبذة عن الفريق", "صف فريقك وأهدافه في جملة قصيرة...",
              maxLines: 3),
          SizedBox(height: 16.h),
          _buildUploadSection(),
          SizedBox(height: 24.h),
          _buildCreateButton(),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            color: Appcolor.black,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
          ),
        ),
        SizedBox(height: 6.h),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: Appcolor.grey,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo",
            ),
            filled: true,
            fillColor: Appcolor.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "شعار الفريق",
          style: TextStyle(
            fontSize: 15.sp,
            color: Appcolor.black,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
          ),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: () {
            // TODO: رفع الشعار
          },
          child: Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: Colors.grey.shade400,
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload_outlined,
                      size: 36.sp, color: Colors.blue),
                  SizedBox(height: 8.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "cairo",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        const TextSpan(text: "اسحب وأفلت الشعار هنا، أو "),
                        TextSpan(
                          text: "تصفح الملفات",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "cairo",
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: "\nPNG, JPG, SVG"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: () {
          // TODO: إنشاء الفريق
        },
        child: Text(
          "إنشاء الفريق",
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
