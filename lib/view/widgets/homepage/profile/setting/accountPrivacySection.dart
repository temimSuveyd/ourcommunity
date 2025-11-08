import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/color.dart';

/// 🔹 حساب والخصوصية – Modern & Elegant Design
class AccountPrivacySection extends StatelessWidget {
  const AccountPrivacySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 5),

      decoration: BoxDecoration(
        // Use a clean white with shadows for depth
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 22,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE with accent-bar
          Padding(
            padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 18.h, bottom: 5.h),
            child: Row(
              children: [
                Container(
                  width: 5.w,
                  height: 23.h,
                  decoration: BoxDecoration(
                    color: Appcolor.primarycolor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "الحساب والخصوصية",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "cairo",
                    color: Appcolor.primarycolor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),

          // CARD-LIKE LISTTILES
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.r),
              ),
              elevation: 0,
              margin: EdgeInsets.zero,
              color: Appcolor.colorbackground,
              child: Column(
                children: [
                  _CustomTile(
                    icon: Icons.lock_outline_rounded,
                    title: "تغيير كلمة المرور",
                    onTap: () {},
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    color: Colors.grey[200],
                  ),
                  _CustomTile(
                    icon: Icons.language_outlined,
                    title: "اللغة",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          // SPECIAL SEPARATION
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Divider(
              thickness: 1.2,
              indent: 26.w,
              endIndent: 26.w,
              color: Colors.grey.shade100,
            ),
          ),

          // BIG "Delete Account" Button
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade50,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              ),
              icon: Icon(Icons.delete_forever, color: Colors.red, size: 22),
              label: Text(
                "حذف الحساب",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: "cairo",
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

/// Custom ListTile for modern look
class _CustomTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _CustomTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: Appcolor.primarycolor.withOpacity(0.10),
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.all(7),
          child: Icon(
            icon,
            color: Appcolor.primarycolor,
            size: 22,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: "cairo",
            color: Appcolor.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded,
            color: Appcolor.primarycolor, size: 16),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        horizontalTitleGap: 12,
        minLeadingWidth: 0,
      ),
    );
  }
}
