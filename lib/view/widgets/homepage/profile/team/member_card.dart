import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/data/model/team/member_model.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({
    super.key,
    required this.memberModel,
  });

  final MemberModel memberModel;
  @override
  Widget build(BuildContext context) {
    final isAdmin = memberModel.userRole == 'admin';
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
            color: isAdmin ? Appcolor.primarycolor : Colors.grey.shade300,
            width: 1),
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
            backgroundImage: NetworkImage(
              memberModel.userPhoto!,
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                memberModel.userName!,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.black,
                ),
              ),
              Text(
                memberModel.userRole!,
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
  }
}
