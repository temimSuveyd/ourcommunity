import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:ourcommunity/controller/group_invitations/group_invitations_controller.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import 'package:ourcommunity/view/widgets/group_invitations_view/Group_Invitations_listView.dart';
import '../../../core/constant/color.dart';

class GroupInvitationsViewPage extends StatelessWidget {
  const GroupInvitationsViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => GroupInvitationsControllerImp(),
    );
    return Scaffold(
      backgroundColor: Appcolor.colorbackground,
      appBar: CustomAppBar(
        'Group Invitations',
        () => Get.back(),
        showLeading: false, 
      ),
      body: GroupInvitationsListView(),
    );
  }
}
