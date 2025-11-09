import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/color.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String image;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 60.w),
      decoration: BoxDecoration(
        color: Appcolor.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Appcolor.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Appcolor.cardColor.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(height: 12.h),
          Text(
            name,
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "cairo",
              fontWeight: FontWeight.bold,
              color: Appcolor.primarTextcolor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            email,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "cairo",
              fontWeight: FontWeight.bold,
              color: Appcolor.grey,
            ),
          ),
        ],
      ),
    );
  }
}
