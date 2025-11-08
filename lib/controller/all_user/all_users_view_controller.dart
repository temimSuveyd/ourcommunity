import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/data/dataScore/remote/membership_requests_data.dart';
import 'package:ourcommunity/data/dataScore/remote/team_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/data/model/membership_requests/membership_requests_model.dart';
import 'package:ourcommunity/data/model/team/team_model.dart';
import 'package:ourcommunity/data/model/user_model.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AllUsersViewController extends GetxController {
  void statusreqest(Statusreqest status);
  void getAllUSers();
  void getAllTeamMembersId();
  Future<void> getSenderData();
  Future<void> getRequestToData(int requsetToId);
  Future<void> sendRequest(int requsetToId);
  void setRequsetData();
  void initData();
  void searchOnUsersData();
}

class AllUsersViewControllerImp extends AllUsersViewController {
  Statusreqest statusR = Statusreqest.success;
  UserData userData = UserData();
  TeamData teamData = TeamData();
  UserModel? senderModel;
  UserModel? requestToModel;
  MembershipRequestsData membershipRequestsData = MembershipRequestsData();
  GroupRequestModel groupRequestModel = GroupRequestModel();
  TeamModel? teamModel;
  List<Map<String, dynamic>> usersList = [];
  List<Map<String, dynamic>> senderDataList = [];
  List<Map<String, dynamic>> requsetTODataList = [];
  List<int> teamMembersIDList = [];
  Services services = Get.find();
  TextEditingController searchController = TextEditingController();

  @override
  void getAllTeamMembersId() {
    try {
      statusreqest(Statusreqest.loading);
      teamData.getMembersId(teamModel!.teamId!).listen(
        (event) {
          if (event.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            teamMembersIDList = event;
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
  void getAllUSers() {
    statusreqest(Statusreqest.loading);

    try {
      userData.getAllUser().listen(
        (event) {
          if (event.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            statusreqest(Statusreqest.success);
            usersList = event;
          }
        },
      );
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    } catch (e) {
      showCustomSnackBar(e.toString());
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  void onInit() async {
    initData();
    getAllUSers();
    getAllTeamMembersId();
    await getSenderData();
    super.onInit();
  }

  @override
  Future<void> sendRequest(int requsetToId) async {
    try {
      await getRequestToData(requsetToId);
      setRequsetData();
      membershipRequestsData.addGroupRequest(
          groupRequestModel: groupRequestModel);
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    } catch (e) {
      showCustomSnackBar(e.toString());
      statusreqest(Statusreqest.success);
    }
  }

  @override
  Future<void> getSenderData() async {
    try {
      final String userUid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      statusreqest(Statusreqest.loading);
      final res = await userData.getUserDataByuid(userUid);
      if (res.isEmpty) {
        statusreqest(Statusreqest.faliure);
      } else {
        senderDataList = res;
        senderModel = UserModel.fromMap(senderDataList.first,'profile_data');
        statusreqest(Statusreqest.success);
      }
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    }
  }

  @override
  Future<void> getRequestToData(int requsetToId) async {
    try {
      statusreqest(Statusreqest.loading);
      final res = await userData.getUserDataByid(requsetToId);
      if (res.isEmpty) {
        statusreqest(Statusreqest.faliure);
      } else {
        requsetTODataList = res;
        requestToModel = UserModel.fromMap(requsetTODataList.first,'profile_data');
        statusreqest(Statusreqest.success);
      }
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    }
  }

  @override
  setRequsetData() {
    groupRequestModel = groupRequestModel.copyWith(
      teamModel: teamModel,
      senderModel: senderModel,
      requesteStatus: 'pending',
      requestToModel: requestToModel,
    );
  }

  @override
  initData() {
    teamModel = Get.arguments['team_model'];
  }

  @override
  void searchOnUsersData() {
    if (searchController.text.isEmpty) {
      getAllUSers();
    } else {
      String query = searchController.text.toLowerCase();
      usersList = usersList.where((user) {
        final name =
            user['profile_data']['name']?.toString().toLowerCase() ?? "";
        final city =
            user['profile_data']['city']?.toString().toLowerCase() ?? "";
        final neighborhood =
            user['profile_data']['neighborhood']?.toString().toLowerCase() ??
                "";
        return name.contains(query) ||
            city.contains(query) ||
            neighborhood.contains(query);
      }).toList();
    }
    update();
  }
}
