
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';

/// 🔹 قسم الحساب والخصوصية
class AccountPrivacySection extends StatelessWidget {
  const AccountPrivacySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الحساب والخصوصية",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo",
            ),
          ),
          SizedBox(height: 12.h),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "تغيير كلمة المرور",
              style: TextStyle(
                fontFamily: "cairo",
                color: Appcolor.grey2,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "اللغة",
              style: TextStyle(
                fontFamily: "cairo",
                color: Appcolor.grey2,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            subtitle: Text(
              "العربية",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "cairo",
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Text(
                "حذف الحساب",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: "cairo",
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}