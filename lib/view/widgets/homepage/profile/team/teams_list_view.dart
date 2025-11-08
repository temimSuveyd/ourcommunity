import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ourcommunity/controller/profile/profile_page_controller.dart';
import 'package:ourcommunity/data/model/team/team_model.dart';
import 'package:ourcommunity/view/widgets/homepage/profile/team/team_card.dart';

class TeamsListView extends StatelessWidget {
  const TeamsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageControllerImp>(
      builder: (controller) => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.teamDataList.length,
        itemBuilder: (context, index) => TeamCard(
          teamModel: TeamModel.fromJson(controller.teamDataList[index]),
          onTap: () => controller.goToQuraaAldasmaPage(
              TeamModel.fromJson(controller.teamDataList[index])),
        ),
      ),
    );
  }
}
