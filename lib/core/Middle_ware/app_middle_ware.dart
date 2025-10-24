import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/services/servieses.dart';

class AppMiddleware extends GetMiddleware {
  Services appService = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    final bool isLogin =
        appService.sharedPreferences.getBool(SharedKeys.isLogin) ?? false;
    if (isLogin) {
      return RouteSettings(name: AppRoutes.forgetpasswordpage);
    } else {
      return RouteSettings(name: AppRoutes.welcomeBackUI);
    }
  }
}
