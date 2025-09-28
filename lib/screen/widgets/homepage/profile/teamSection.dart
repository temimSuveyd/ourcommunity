import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/color.dart';


class TeamSection extends StatelessWidget {
  final Function() onCreateTeam;
  final List<Map<String, dynamic>> teams;

  const TeamSection({
    super.key,
    required this.onCreateTeam,
    required this.teams,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Appcolor.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Appcolor.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصف العلوي
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.group, color: Appcolor.primarycolor),
                  SizedBox(width: 6.w),
                  Text(
                    "فرقّي",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cairo",
                      color: Appcolor.black,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: onCreateTeam,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Appcolor.grey, width: 1),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10.r,
                        backgroundColor: Appcolor.grey.withOpacity(0.2),
                        child: const Icon(Icons.add, color: Appcolor.black, size: 12),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        " فريق جديد",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "cairo",
                          color: Appcolor.black,
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

          // قائمة الفرق
          Column(
            children: teams.map((team) {
              return Column(
                children: [
                  InkWell(
                    onTap: team["onTap"],
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24.r,
                          backgroundImage: AssetImage(team["image"]),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                team["title"],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold,
                                  color: Appcolor.black,
                                ),
                              ),
                              Text(
                                team["subtitle"],
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: "cairo",
                                  color: Appcolor.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: team["onTap"],
                          child: Text(
                            "إدارة",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "cairo",
                              fontWeight: FontWeight.w800,
                              color: Appcolor.primarycolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (team != teams.last) const Divider(),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
