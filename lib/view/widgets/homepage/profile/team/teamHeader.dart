import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/team/team_view_controller.dart';

import '../../../../../core/constant/color.dart';

class TeamHeader extends StatelessWidget {
  const TeamHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Appcolor.cardColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Appcolor.grey,width: 0.5),
      ),
      child: GetBuilder<TeamViewControllerImp>(
        builder: (controller) => Column(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: NetworkImage(
                controller.teamModel!.teamLogo!,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              controller.teamModel!.teamName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Appcolor.primarTextcolor,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              controller.teamModel!.teamDescription!,
              style: TextStyle(
                fontSize: 15.sp,
                color: Appcolor.secondTextcolor,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
