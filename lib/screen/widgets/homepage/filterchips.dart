import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../controller/homepagecontroller.dart';
import '../../../core/constant/color.dart';

class FilterChips extends StatelessWidget {
  final HomeController controller;
  const FilterChips({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Wrap(
      spacing: 10.w,
      runSpacing: 8.h,
      children: [
        _buildFilterChip(
          controller.selectedGovernorate.value,
          Iconsax.map5,
        ),
        _buildFilterChip(
          controller.selectedCategory.value,
          Iconsax.category5,
        ),
        _buildFilterChip("".tr, Iconsax.cup5),
      ],
    ));
  }

  Widget _buildFilterChip(String label, IconData icon, [VoidCallback? onTap]) {
    return FilterChip(
      avatar: Icon(icon, size: 18.sp, color: Appcolor.primarycolor),
      label: Text(
        label.tr, // ✅ استخدام الترجمة هنا
        style: TextStyle(
          color: Appcolor.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "cairo",
        ),
      ),
      backgroundColor: Colors.white,
      selectedColor: Colors.blue.shade50,
      onSelected: (_) {
        if (onTap != null) onTap();
      },
    );
  }
}
