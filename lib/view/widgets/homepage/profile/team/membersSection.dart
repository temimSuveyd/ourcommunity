import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/controller/team/team_view_controller.dart';
import 'package:ourcommunity/data/model/team/member_model.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/custom_dialog.dart';
import 'package:ourcommunity/view/widgets/homepage/profile/team/member_card.dart';
import '../../../../../core/constant/color.dart';

class MembersSection extends StatelessWidget {
  const MembersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamViewControllerImp>(
      builder: (controller) => Column(
        children: [
          /// 🔹 دعوة عضو + العدد
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.group, color: Appcolor.primarycolor),
                  SizedBox(width: 6.w),
                  Text(
                    "Members (${controller.membersList.length})", // Count from API
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.primarTextcolor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolor.primarycolor,
                  padding: EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  final isAdmin =
                      controller.teamModel!.builderId == controller.userId;
                  if (isAdmin) {
                    controller.goToAllUsersPage(controller.teamModel!);
                  } else {
                    customDialog(
                      'Not Allowed',
                      'You are not an admin. Only admins can invite new members to the team.',
                      'OK',
                      '',
                    );
                  }
                },
                icon: const Icon(Icons.person_add_alt_1, color: Colors.white),
                label: Text(
                  "Invite",
                  style: TextStyle(
                    color: Appcolor.primarTextcolor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          //قائمة الأعضاء
          Column(
            children: List.generate(controller.membersList.length, (index) {
              final data = controller.membersList[index];
              final memberModel = MemberModel.fromJson(data);
              final isAdmin = memberModel.userRole == 'admin';
              if (isAdmin) {
                return MemberCard(
                  memberModel: memberModel,
                );
              }
              return MemberCard(
                memberModel: memberModel,
              );
            }),
          ),
        ],
      ),
    );
  }
}
