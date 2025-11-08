import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class ImageUploadCard extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback onPickImage;

  const ImageUploadCard({
    super.key,
    required this.imageUrl,
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
        child:  
          imageUrl != null?
             ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ):
         
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, size: 40.sp, color: Appcolor.grey),
                SizedBox(height: 8.h),
                Text(
                  "Tap to upload image",
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
                    "Browse Files",
                    style: TextStyle(
                      color: Appcolor.primarycolor,
                      fontFamily: "cairo",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
        
      ),
    );
  }
}
