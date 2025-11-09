import 'dart:developer';

import 'package:get/get.dart';
import 'package:ourcommunity/controller/home/home_page_controller.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/data/dataScore/remote/team_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/data/model/team/team_model.dart';
import 'package:ourcommunity/data/model/user_model.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProfilePageController extends GetxController {
  void statusreqest(Statusreqest status);

  void goToCreateTeamPage();
  void goToQuraaAldasmaPage(TeamModel teamModel);
  Future<void> getTeams();
  Future<void> getUserData();
  void selectUserData();
  void goToEditProfilePage();
  void sginOut();
  void goToMyEventsPage();
  void goToSettingsPage();
}

class ProfilePageControllerImp extends ProfilePageController {
  List<Map<String, dynamic>> teamDataList = [];
  List<Map<String, dynamic>> userDataList = [];
  int? userId;
  TeamData teamData = TeamData();
  Services services = Get.find();
  UserData userData = UserData();
  UserModel? userModel = UserModel();
  Statusreqest statusR = Statusreqest.loading;

  @override
  void goToCreateTeamPage() {
    Get.toNamed(AppRoutes.createTeamPage);
  }

  @override
  void goToQuraaAldasmaPage(TeamModel teamModel) {
    Get.toNamed(AppRoutes.quraaAldasmaPage, arguments: {
      'team_model': teamModel,
    });
    Get.delete<ProfilePageControllerImp>();
  }

  @override
  Future<void> getTeams() async {
    try {
      statusreqest(Statusreqest.loading);
      final res = await teamData.getTeams(userModel!.id!);
      teamDataList = res;
      statusreqest(Statusreqest.success);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  Future<void> getUserData() async {
    try {
      statusreqest(Statusreqest.loading);
      final String uid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      final res = await userData.getUserDataByuid(uid);
      if (res.isEmpty) {
        statusreqest(Statusreqest.faliure);
      } else {
        userDataList = res;
        selectUserData();
      }
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  void selectUserData() {
    final data = userDataList.first;
    userModel = UserModel.fromMap(data, 'profile_data');
    statusreqest(Statusreqest.success);
  }

  @override
  void goToEditProfilePage() {
    Get.toNamed(AppRoutes.editProfilePage, arguments: {
      'user_model': userModel,
    });
    Get.delete<ProfilePageControllerImp>();
  }

  @override
  void onInit() async {
    await getUserData();
    await getTeams();
    super.onInit();
  }

  @override
  void sginOut() {
    Supabase.instance.client.auth.signOut();
    Get.offAllNamed(AppRoutes.loginPage);
    services.sharedPreferences.clear();
  }

  @override
  void goToMyEventsPage() {
    Get.toNamed(
      AppRoutes.myEventsPage,
    );
  }

  @override
  void goToSettingsPage() {
    Get.toNamed(
      AppRoutes.settingsPage,
    );
  }
}
