import 'dart:developer';

import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:ourcommunity/data/dataScore/remote/team_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/data/model/team/team_model.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/custom_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class TeamViewController extends GetxController {
  void selectTap(int index);
  void initData();
  void getTeamMembers();
  void statusreqest(Statusreqest status);
  void goToAllUsersPage(TeamModel teamModel);
  void goToEditTeamInfoPage(TeamModel teamModel);
  void backToLastPage(TeamModel teamModel);
  void deleteTeam();
  Future<void> getUserDataByuid();
}

class TeamViewControllerImp extends TeamViewController {
  int selectedTap = 1;
  TeamModel? teamModel;
  TeamData teamData = TeamData();
  Statusreqest statusR = Statusreqest.success;
  List<Map<String, dynamic>> membersList = [];
  UserData userData = UserData();
  Services services = Get.find();
  int? userId;

  @override
  void selectTap(int index) {
    selectedTap = index;
    update();
  }

  @override
  void initData()async {
    teamModel = Get.arguments['team_model'];
    getUserDataByuid();
  }

  @override
  void onInit() {
    initData();
    getTeamMembers();
    super.onInit();
  }

  @override
  void getTeamMembers() {
    try {
      statusreqest(Statusreqest.loading);
      teamData.getMembers(teamModel!.teamId!).listen(
        (event) {
          if (event.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            membersList = event;
            statusreqest(Statusreqest.success);
          }
        },
      );
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
      showCustomSnackBar(e.toString());
    }
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  void goToAllUsersPage(TeamModel teamModel) {
    Get.toNamed(AppRoutes.allUsersViewPage, arguments: {
      'team_model': teamModel,
    });
  }

  @override
  void goToEditTeamInfoPage(TeamModel teamModel) {
    Get.toNamed(AppRoutes.editTeamInfoPage, arguments: {
      'team_model': teamModel,
    });
    Get.delete<TeamViewControllerImp>();
  }

  @override
  void backToLastPage(TeamModel teamModel) {
    Get.toNamed(AppRoutes.homePage, arguments: {
      'team_model': teamModel,
    });
  }

  @override
  void deleteTeam() async {
    try {
      final delete = await customDialog(
          'Delte this team',
          'Are you sure you want to delete this team?If you delete the team, all team members will be deleted as well.',
          'Confierm',
          'Cancel');
      if (delete) {
        statusreqest(Statusreqest.loading);
        await teamData.deleteTeam(teamModel!.teamId!);
        showCustomSnackBar('Team deleted successfully');
        statusreqest(Statusreqest.success);
        Get.offAllNamed(AppRoutes.homePage);
      }
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
      showCustomSnackBar(e.toString());
    }
  }

  @override
  Future<void> getUserDataByuid() async {
    try {
      final String userUid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      statusreqest(Statusreqest.loading);
      final res = await userData.getUserDataByuid(userUid);
      if (res.isEmpty) {
        statusreqest(Statusreqest.faliure);
      } else {
        final id = res.first['id'];
        userId = id;
        statusreqest(Statusreqest.success);
      }
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    }
  }
}
