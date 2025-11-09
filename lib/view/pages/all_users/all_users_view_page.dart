import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/all_user/all_users_view_controller.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/view/widgets/all_users/all_users_listView.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import 'package:ourcommunity/view/widgets/auth/customtextfield.dart';

class AllUsersViewPage extends StatelessWidget {
  const AllUsersViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => AllUsersViewControllerImp(),
    );
    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      appBar: CustomAppBar(
        'Send verifaction',
        () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 45,
                child: GetBuilder<AllUsersViewControllerImp>(
                  builder: (controller) => CustomTextField(
                    controller: controller.searchController,
                    onChanged: (value) => controller.searchOnUsersData(),
                    hint: 'Search',
                    icon: Icons.search,
                    validator: (value) {},
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 20,
            )),
            AllUsersListView()
          ],
        ),
      ),
    );
  }
}
