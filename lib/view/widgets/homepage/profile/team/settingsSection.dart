import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/team/team_view_controller.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/view/widgets/homepage/profile/team/settingItem.dart';

class SettingsSection extends GetView<TeamViewControllerImp> {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingItem(
          title: "Edit Team Information",
          subtitle: "Change team name, logo, rules, and more.",
          buttonText: "Edit Information",
          icon: Icons.settings,
          isPrimary: true,
          onPressed: () => controller.goToEditTeamInfoPage(controller.teamModel!),
          color: Appcolor.primarycolor,
        ),
            SettingItem(
          title: "Danger Zone",
          subtitle: "Warning!The actions here may irreversibly delete your team and all your data.",
          buttonText: "Delete Team",
          icon: Icons.delete,
          isPrimary: true,
          onPressed: () => controller.deleteTeam(),
          color: Appcolor.red,
        ),
      SizedBox(height: 20,),
      ],
    );
  }
}
