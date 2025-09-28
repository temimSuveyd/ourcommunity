import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../controller/homepagecontroller.dart';
import '../../../core/constant/color.dart';

class FilterDrawer extends StatelessWidget {
  final HomeController controller;
  const FilterDrawer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(-4, 0),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(height: 40.h),
            Center(
              child: Text(
                "فلتر إضافية",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ السعر
            _FilterSectionTitle(title: "السعر"),
            Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.priceOptions.map((option) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: option,
                        groupValue: controller.price.value,
                        activeColor: Appcolor.primarycolor,
                        onChanged: (value) {
                          controller.price.value = value!;
                        },
                      ),
                      Text(
                        option,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  );
                }).toList(),
              ),
            )),

            const SizedBox(height: 30),

            // ✅ الفئة العمرية
            _FilterSectionTitle(title: "الفئة العمرية"),
            Obx(() => _CustomDropdown(
              value: controller.ageGroup.value,
              items: controller.ageOptions,
              onChanged: (value) => controller.ageGroup.value = value!,
            )),

            const SizedBox(height: 30),

            // ✅ الجنس
            _FilterSectionTitle(title: "الجنس"),
            Obx(() => _CustomDropdown(
              value: controller.gender.value,
              items: controller.genderOptions,
              onChanged: (value) => controller.gender.value = value!,
            )),

            SizedBox(height: 250.h),

            // ✅ زر إعادة تعيين
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.primarycolor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                controller.resetFilters();
              },
              icon: Icon(Iconsax.refresh, color: Appcolor.white, size: 18.sp),
              label: Text(
                "إعادة تعيين",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "cairo",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ عنصر عنوان قسم الفلتر
class _FilterSectionTitle extends StatelessWidget {
  final String title;
  const _FilterSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey[700],
      ),
    );
  }
}

// ✅ Dropdown مخصص
class _CustomDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _CustomDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appcolor.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          underline: const SizedBox(),
          items: items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
