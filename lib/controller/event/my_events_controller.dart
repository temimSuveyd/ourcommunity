import 'package:get/get.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/data/dataScore/remote/my_events_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class MyEventsController extends GetxController {
  void getMyEvents();
  void getUserData();
  void statusreqest(Statusreqest status);
}

class MyEventsControllerImp extends MyEventsController {
  Statusreqest statusR = Statusreqest.success;
  MyEventsData myEventsData = MyEventsData();
  Services services = Get.find();
  UserData userData = UserData();
  List<Map<String, dynamic>> eventsList = [];
  int? userId;

  @override
  void getMyEvents() {
    try {
      statusreqest(Statusreqest.loading);
      myEventsData.getMyEvents(userId!).listen(
        (event) {
          if (eventsList.isEmpty) {
            eventsList = event;
            statusreqest(Statusreqest.success);
          } else {
            statusreqest(Statusreqest.faliure);
          }
        },
      );
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.faliure);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  void getUserData() async {
    try {
      final String uid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      final res = await userData.getUserDataByuid(uid);
      if (res.isNotEmpty) {
        final id = res.first["id"];
        userId = id;
        getMyEvents();
      } else {
        statusreqest(Statusreqest.faliure);
      }
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }
}
