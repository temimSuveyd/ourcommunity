import 'package:get/get.dart';
import 'package:ourcommunity/controller/network_check_controller.dart';
import 'package:ourcommunity/core/constant/dataBase_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Services extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<Services> init() async {
    await Supabase.initialize(
      url: DatabaseKeys.supabaseUrl,
      anonKey: DatabaseKeys.supabaseKey,
    );
    sharedPreferences = await SharedPreferences.getInstance();
    Get.put(NetworkCheckControllerImp());
    return this;
  }
}

initailservieses() async {
  await Get.putAsync(() => Services().init());
}
