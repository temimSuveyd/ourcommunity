import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constant/color.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(15.r),
      child: TextField(
        decoration: InputDecoration(
          hintText: "ابحث عن فعالية...",
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Icon(Iconsax.search_normal, color: Colors.grey.shade500),
          suffixIcon: Icon(Iconsax.microphone5, color: Appcolor.primarycolor),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
          EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        ),
      ),
    );
  }
}
