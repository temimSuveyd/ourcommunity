import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/controller/profile/profile_page_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import '../../../core/constant/Approutes.dart';
import '../../../core/constant/color.dart';
import '../../widgets/homepage/profile/logoutButton.dart';
import '../../widgets/homepage/profile/profileHeader.dart';
import '../../widgets/homepage/profile/profileOptionTile.dart';
import '../../widgets/homepage/profile/teamSection.dart';

class ProfilePage extends GetView<ProfilePageControllerImp> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ProfilePageControllerImp(),
    );
    return Scaffold(
      appBar: CustomAppBar('Profile', () => Get.back(),showLeading: false,),
      body: GetBuilder<ProfilePageControllerImp>(
        builder: (controller) => 
       HandlingDataView(
        status: controller.statusR,
         child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:  ProfileHeader(
                  name: controller.userModel!.name ?? '',
                  email: controller.userModel!.email ?? '',
                  image: controller.userModel!.photo ?? '',
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Appcolor.cardColor,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Appcolor.grey.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Appcolor.shadowColor,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ProfileOptionTile(
                        icon: Icons.edit,
                        title: "Edit Profile",
                        onTap: () => controller.goToEditProfilePage(),
                      ),
                      Divider(height: 1, color: Appcolor.grey.withOpacity(0.3)),
                      ProfileOptionTile(
                        icon: Iconsax.calendar,
                        title: "My events",
                        onTap: () => controller.goToMyEventsPage(),
                      ),
                      Divider(height: 1, color: Appcolor.grey.withOpacity(0.3)),
                      ProfileOptionTile(
                        icon: Icons.settings,
                        title: "Settings",
                        onTap: () => Get.toNamed(AppRoutes.settingsPage),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: TeamSection(
                  onCreateTeam: () => controller.goToCreateTeamPage(),
                ),
              ),
              SliverToBoxAdapter(
                child: LogoutButton(
                  onLogout: () => controller.sginOut(),
                ),
              ),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 70,
              )),
            ],
          ),
       ),
      ),
    );
  }
}
