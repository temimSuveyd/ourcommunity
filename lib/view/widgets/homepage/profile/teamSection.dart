import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/view/widgets/homepage/profile/team/teams_list_view.dart';
import '../../../../core/constant/color.dart';

class TeamSection extends StatelessWidget {
  final Function() onCreateTeam;
  const TeamSection({
    super.key,
    required this.onCreateTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Appcolor.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Appcolor.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.group, color: Appcolor.primarycolor),
                  SizedBox(width: 6.w),
                  Text(
                    "My Teams",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cairo",
                      color: Appcolor.primarTextcolor,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: onCreateTeam,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Appcolor.grey, width: 1),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10.r,
                        backgroundColor: Appcolor.grey2,
                        child: const Icon(Icons.add,
                            color: Appcolor.black, size: 12),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "New Team",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "cairo",
                          color: Appcolor.primarTextcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Teams List
          TeamsListView(),
        ],
      ),
    );
  }
}
