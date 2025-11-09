import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/team/create_team_controller.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import '../../widgets/homepage/profile/createteam/teamFormContainer.dart';

class CreateTeamPage extends StatelessWidget {
  const CreateTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => CreateTeamControllerImp(),
    );
    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      appBar: CustomAppBar('Create New Team', () => Get.back()),
      body: const TeamFormContainer(), // ✅ استدعاء الودجت المنفصل
    );
  }
}
