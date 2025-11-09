import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/data/model/team/team_model.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.teamModel,
    required this.onTap,
  });
  final TeamModel teamModel;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundImage: NetworkImage(teamModel.teamLogo!),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    teamModel.teamName!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold,
                      color: Appcolor.primarTextcolor,
                    ),
                  ),
                ),
                Text(
                  teamModel.teamDescription!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: "cairo",
                    color: Appcolor.secondTextcolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => onTap(),
            child: Text(
              "View",
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
    );
  }
}
