import 'dart:developer';

import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/params/favorite_events_prams.dart';
import 'package:ourcommunity/data/dataScore/remote/favorite_events_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FavoriteEventsController extends GetxController {
  Future<void> getAllFavoriteIds();
  getAllEvents();
  void statusreqest(Statusreqest status);
  Future<void> getUserData();
  toggleFavoriteEvent(int eventId);
  removeEventFromFavoriteList(int id);
  addEventToFavoriteList(int id);
}

class FavoriteEventsControllerImp extends FavoriteEventsController {
  Statusreqest statusR = Statusreqest.success;
  FavoriteEventsData favoriteEventsData = FavoriteEventsData();
  UserData userData = UserData();
  Services services = Get.find();
  int? userId;
  List<Map<String, dynamic>> userDataList = [];
  List<Map<String, dynamic>> eventsList = [];

  List<int> favoritesIdsList = [];

  @override
  Future<void> getUserData() async {
    try {
      statusreqest(Statusreqest.loading);
      final uid = services.sharedPreferences.getString(SharedKeys.userUid);
      final res = await userData.getUserDataById(uid!);
      userDataList = res;
      if (userDataList.isNotEmpty) {
        final int id = userDataList.first["id"];
        userId = id;
        statusreqest(Statusreqest.success);
      } else {
        statusreqest(Statusreqest.faliure);
      }
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  Future<void> getAllFavoriteIds() async {
    try {
      statusreqest(Statusreqest.loading);
      final res = await favoriteEventsData.getAllFavoriteEventsId(userId!);
      if (res.isEmpty) {
        statusreqest(Statusreqest.noData);
      } else {
        favoritesIdsList = res;
        statusreqest(Statusreqest.success);
      }
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      log(e.message);
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  getAllEvents() async {
    try {
      statusreqest(Statusreqest.loading);

      favoriteEventsData.getAllFavoriteEvents(favoritesIdsList).listen(
        (value) {
          if (value.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            eventsList = value;
            statusreqest(Statusreqest.success);
          }
        },
      );
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  toggleFavoriteEvent(int eventId) async {
    try {
      FavoriteEventsPrams params = FavoriteEventsPrams(
        eventId: eventId,
        userId: userId,
      );
      if (favoritesIdsList.contains(eventId)) {
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
    favoritesIdsList.remove(id);
    update();
  }

  @override
  addEventToFavoriteList(int id) {
    favoritesIdsList.add(id);
    update();
  }

  @override
  void onInit() async {
    await getUserData();
    await getAllFavoriteIds();
    getAllEvents();
    super.onInit();
  }
}
