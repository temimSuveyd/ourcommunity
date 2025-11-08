import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ourcommunity/controller/all_user/all_users_view_controller.dart';
import 'package:ourcommunity/core/class/sliver_handlingDataView.dart';
import 'package:ourcommunity/data/model/user_model.dart';
import 'package:ourcommunity/view/widgets/all_users/all_users_card.dart';

class AllUsersListView extends StatelessWidget {
  const AllUsersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllUsersViewControllerImp>(
      builder: (controller) => SliverHandlingDataView(
        status: controller.statusR,
        child: SliverList.builder(
            itemCount: controller.usersList.length,
            itemBuilder: (context, index) {
              final data = controller.usersList[index];
              final userModel = UserModel.fromMap(data,'profile_data');
              final bool isOnTeam =
                  controller.teamMembersIDList.contains(userModel.id);

              return AllUsersCard(
                isOnTeam: isOnTeam,
                  onPressed: () => controller.sendRequest(userModel.id!),
                  userModel: userModel);
            }),
      ),
    );
  }
}
