import 'dart:developer';

import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/params/team_params.dart';
import 'package:ourcommunity/data/dataScore/remote/membership_requests_data.dart';
import 'package:ourcommunity/data/dataScore/remote/team_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/data/model/membership_requests/membership_requests_model.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GroupInvitationsController extends GetxController {
  void statusreqest(Statusreqest status);
  Future<void> getUserDataByuid();
  void getGroupInvitations();
  Future<void> addMemeberToTeam(GroupRequestModel? groupRequestModel);
  Future<void> updateGroupRequestStatus(
      GroupRequestModel? groupRequestModel, String newStatus);
  void goToTeamDetails(GroupRequestModel? groupRequestModel);
}

class GroupInvitationsControllerImp extends GroupInvitationsController {
  Statusreqest statusR = Statusreqest.success;
  UserData userData = UserData();
  MembershipRequestsData membershipRequestsData = MembershipRequestsData();
  TeamData teamData = TeamData();
  Services services = Get.find();
  List<Map<String, dynamic>> userDataList = [];
  List<Map<String, dynamic>> membershipRequestsDataList = [];
  int? userId;
  TeamParams teamParams = TeamParams();

  @override
  void getGroupInvitations() {
    try {
      membershipRequestsData.getRequestsByRequestToId(userId!).listen(
        (event) {
          if (event.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            membershipRequestsDataList = event;
            statusreqest(Statusreqest.success);
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
  Future<void> getUserDataByuid() async {
    try {
      final String userUid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      statusreqest(Statusreqest.loading);
      final res = await userData.getUserDataByuid(userUid);
      if (res.isEmpty) {
        statusreqest(Statusreqest.faliure);
      } else {
        userDataList = res;
        final data = userDataList.first;
        userId = data['id'];
        statusreqest(Statusreqest.success);
      }
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
    await getUserDataByuid();
    getGroupInvitations();
    super.onInit();
  }

  @override
  Future<void> addMemeberToTeam(GroupRequestModel? groupRequestModel) async {
    try {
      statusreqest(Statusreqest.loading);
      teamParams = teamParams.copyWith(
        teamId: groupRequestModel!.teamModel!.teamId!,
        userId: userId!,
        role: 'member',
        joinedAt: DateTime.now(),
        userName: groupRequestModel.requestToModel!.name,
        userPhoto: groupRequestModel.requestToModel!.photo,
      );

      await teamData.addMemberToTeam(teamParams);
      await updateGroupRequestStatus(groupRequestModel, 'accepted');
      statusreqest(Statusreqest.success);
    } on PostgrestException catch (e) {
      log(e.message);
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
      showCustomSnackBar(e.toString());
    } finally {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  Future<void> updateGroupRequestStatus(
      GroupRequestModel? groupRequestModel, String newStatus) async {
    try {
      statusreqest(Statusreqest.loading);
      await membershipRequestsData.updateRequestStatus(
          requestId: groupRequestModel!.id!, newStatus: newStatus);
      statusreqest(Statusreqest.success);
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
      showCustomSnackBar(e.toString());
    } finally {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  void goToTeamDetails(GroupRequestModel? groupRequestModel) {
    Get.toNamed(AppRoutes.quraaAldasmaPage, arguments: {
      'team_model': groupRequestModel!.teamModel,
    });
  }
}
