import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';

class ImageUploadCard extends StatelessWidget {
  final Rx<File?> imageFile;
  final VoidCallback onPickImage;

  const ImageUploadCard({
    super.key,
    required this.imageFile,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPickImage,
      child: Container(
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Appcolor.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Appcolor.grey, width: 1.5),
        ),
        child: Obx(() {
          if (imageFile.value != null) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                imageFile.value!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, size: 40.sp, color: Appcolor.grey),
                SizedBox(height: 8.h),
                Text(
                  "اسحب وأفلت الصورة هنا",
                  style: TextStyle(
                    color: Appcolor.grey,
                    fontFamily: "cairo",
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: onPickImage,
                  child: Text(
                    "تصفح الملفات",
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: "cairo",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
