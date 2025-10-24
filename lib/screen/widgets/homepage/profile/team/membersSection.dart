import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../controller/teamController.dart';
import '../../../../../core/constant/Approutes.dart';
import '../../../../../core/constant/color.dart';


class MembersSection extends StatelessWidget {
  final TeamController controller;
  const MembersSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🔹 دعوة عضو + العدد
        Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.primarycolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onPressed: () => Get.toNamed(AppRoutes.inviteMemberPage),
              icon: const Icon(Icons.person_add, color: Colors.white),
              label: Text(
                "دعوة عضو",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.group, color: Appcolor.primarycolor),
                SizedBox(width: 6.w),
                Text(
                  "الأعضاء (12)", // العدد من API
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 16.h),

        /// 🔹 قائمة الأعضاء
        Column(
          children: List.generate(5, (index) {
            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade300, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28.r,
                    backgroundImage: const NetworkImage(
                      "https://via.placeholder.com/150",
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اسم العضو ${index + 1}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Appcolor.black,
                        ),
                      ),
                      Text(
                        "عضو",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
