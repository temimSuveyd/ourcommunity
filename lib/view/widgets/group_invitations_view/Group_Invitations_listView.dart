import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/group_invitations/group_invitations_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/data/model/membership_requests/membership_requests_model.dart';
import 'package:ourcommunity/view/widgets/group_invitations_view/group_invitations_card.dart';

class GroupInvitationsListView extends StatelessWidget {
  const GroupInvitationsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupInvitationsControllerImp>(
      builder: (controller) => HandlingDataView(
        status: controller.statusR,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          itemBuilder: (context, index) {
            final data = controller.membershipRequestsDataList[index];
            final groupRequestModel = GroupRequestModel.fromMap(data);
            return GroupInvitationsCard(
              groupRequestModel: groupRequestModel,
              onAccept: () => controller.addMemeberToTeam(groupRequestModel),
              onDecline: () => controller.updateGroupRequestStatus(
                  groupRequestModel, 'declined'),
              onDetails: () => controller.goToTeamDetails(groupRequestModel),
              isSender: controller.userId == groupRequestModel.senderModel!.id,
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemCount: controller.membershipRequestsDataList.length,
        ),
      ),
    );
  }
}
