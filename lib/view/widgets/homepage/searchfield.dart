import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/constant/color.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key, required this.controller, required this.onChanged});
  final TextEditingController controller;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        onChanged: (value) => onChanged(value),
        decoration: InputDecoration(
          hintText: "ابحث عن فعالية...",
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Icon(
            Iconsax.search_normal,
            color: Colors.grey.shade500,
            size: 20,
          ),
          suffixIcon: Icon(Iconsax.microphone5, color: Appcolor.primarycolor),
          filled: true,
          fillColor: Appcolor.backgroundColor == Appcolor.lighetThemeBackground
              ? const Color.fromARGB(255, 239, 239, 239)
              : Appcolor.cardColor,
          contentPadding:
              EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Appcolor.primarycolor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
