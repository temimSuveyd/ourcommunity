import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';
import 'dashedBorderPainter.dart';

class UploadCardWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const UploadCardWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
            color: Appcolor.black,
          ),
        ),
        SizedBox(height: 10.h),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: CustomPaint(
              painter: DashedBorderPainter(
                color: Colors.grey.shade500,
                radius: 12.r,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 36.sp,
                      color: Appcolor.primarycolor,
                    ),
                    SizedBox(height: 8.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: "cairo",
                          color: Appcolor.grey2,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(text: "اسحب وأفلت الصورة هنا أو "),
                          TextSpan(
                            text: "تصفح الملفات",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "cairo",
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
