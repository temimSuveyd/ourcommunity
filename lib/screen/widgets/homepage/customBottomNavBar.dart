// ✅ شريط التنقل السفلي
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../controller/homepagecontroller.dart';
import '../../../core/constant/color.dart';

class BottomNavBar extends StatelessWidget {
  final HomeController controller;
  const BottomNavBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Appcolor.primarycolor,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "cairo",
          fontSize: 15.sp,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "cairo",
          fontSize: 15.sp,
        ),
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Iconsax.home5), label: "home".tr),
          BottomNavigationBarItem(
              icon: const Icon(Iconsax.heart5), label: "favorites".tr),
          BottomNavigationBarItem(
              icon: const Icon(Iconsax.star5), label: "recommendations".tr),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: "profile".tr),
        ],
      ),
    );
  }
}
