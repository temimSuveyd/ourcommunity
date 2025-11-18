import 'dart:developer';

import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/params/favorite_events_prams.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:ourcommunity/data/dataScore/remote/event_data.dart';
import 'package:ourcommunity/data/dataScore/remote/favorite_events_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';
import 'package:ourcommunity/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class EventDetailsController extends GetxController {
  void intData();
  void statusreqest(Statusreqest status);
  toggleFavoriteEvent(int eventId);
  getFavoriteState();
  removeEventFromFavoriteList(int id);
  addEventToFavoriteList(int id);
  getUserDataById();
  Future<void> addMemberToEvent();
  Future<void> chackeJoinedStatus();
  Future<void> deleteMemberFromEvent();
  void getAllMembers();
}

class EventDetailsControllerImp extends EventDetailsController {
  EventData eventData = EventData();
  UserData userData = UserData();
  FavoriteEventsData favoriteEventsData = FavoriteEventsData();
  Statusreqest statusR = Statusreqest.success;
  EventModel? eventModel;
  UserModel userModel = UserModel();
  int? userid;
  Services services = Get.find();
  bool isEventFavorited = false;
  bool isJoined = false;
  bool isBuilder = false;
  List<Map<String, dynamic>> membersList = [];
  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  Future getFavoriteState() async {
    try {
      final res = await favoriteEventsData.isEventFavorited(
          userId: userid!, eventId: eventModel!.id!);
      isEventFavorited = res;
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  toggleFavoriteEvent(int eventId) async {
    try {
      FavoriteEventsPrams params = FavoriteEventsPrams(
        eventId: eventId,
        userId: userid!,
      );
      if (isEventFavorited!) {
        removeEventFromFavoriteList(eventId);
        await favoriteEventsData.deleteEventFromFavorite(params);
      } else {
        addEventToFavoriteList(eventId);
        await favoriteEventsData.addEventToFavorite(params);
      }
      update();
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message.toString());
    }
  }

  @override
  removeEventFromFavoriteList(int id) {
    isEventFavorited = false;
    update();
  }

  @override
  addEventToFavoriteList(int id) {
    isEventFavorited = true;
    update();
  }

  @override
  Future getUserDataById() async {
    try {
      final String userUid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      statusreqest(Statusreqest.loading);

      var res = await userData.getUserDataByuid(userUid);

      if (res.isEmpty) {
        statusreqest(Statusreqest.noData);
      } else {
        final userDataList = res;
        final data = userDataList.first;
        userModel = UserModel.fromMap(data, 'profile_data');
        userid = userModel.id;
        statusreqest(Statusreqest.success);
      }
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    }
  }

  @override
  void intData() async {
    eventModel = Get.arguments["event_model"];
    await getUserDataById();
    await getFavoriteState();
    chackeJoinedStatus();
    getAllMembers();
  }

  @override
  void onInit() {
    intData();
    super.onInit();
  }

  @override
  Future<void> addMemberToEvent() async {
    try {
      final String uid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      await eventData.addMemberToEvent(
        userModel: userModel,
        userUid: uid,
        eventId: eventModel!.id!,
      );
      isJoined = true;
      statusreqest(Statusreqest.success);
      showCustomSnackBar("Event joined successfully");
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
      showCustomSnackBar(e.toString());
    }
  }

  @override
  Future<void> deleteMemberFromEvent() async {
    try {
      await eventData.deleteMemberFromEvent(
        userId: userid!,
        eventId: eventModel!.id!,
      );
      isJoined = false;
      statusreqest(Statusreqest.success);
      showCustomSnackBar("You have successfully quit the event");
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
      showCustomSnackBar(e.toString());
    }
  }

  @override
  Future<void> chackeJoinedStatus() async {
    statusreqest(Statusreqest.loading);
    try {
      final _isJoined =
          await eventData.userInEvent(eventModel!.id!, userModel.id!);
      isJoined = _isJoined;
      statusreqest(Statusreqest.success);
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      log(e.message);
      statusreqest(Statusreqest.success);
    } catch (e) {
      showCustomSnackBar(e.toString());
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  void getAllMembers() {
    if (userModel.id == eventModel!.userId!) {
      isBuilder = true;
      statusreqest(Statusreqest.loading);
      try {
        eventData.getEventMembersStream(eventModel!.id!).listen(
          (members) {
            membersList = members;
            statusreqest(Statusreqest.success);
          },
        );
      } on PostgrestException catch (e) {
        statusreqest(Statusreqest.success);
        showCustomSnackBar(e.message);
      } catch (e) {
        statusreqest(Statusreqest.faliure);
        showCustomSnackBar(e.toString());
      }
    } else {
      isBuilder = false;
    }
    update();
  }
}
