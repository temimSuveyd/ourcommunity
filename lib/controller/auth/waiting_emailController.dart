import 'dart:developer';

import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class WaitingEmailcontroller extends GetxController {
  void statusreqest(Statusreqest status);
  authStateLisener();
  initData();
}

class WaitingEmailcontrollerImpl extends WaitingEmailcontroller {
  Statusreqest statusR = Statusreqest.success;
  final SupabaseClient supabase = Supabase.instance.client;
  String? userEmail;

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  authStateLisener() async {
    try {
      statusreqest(Statusreqest.loading);
      supabase.auth.onAuthStateChange.listen((data) {
        final AuthChangeEvent event = data.event;
        final Session? session = data.session;
        if (event == AuthChangeEvent.signedIn && session != null) {
          final user = session.user;
          final isEmailVerified = user.emailConfirmedAt != null;
          if (isEmailVerified) {
            Get.toNamed(AppRoutes.homePage);
          }
        }
      });
    } on AuthApiException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } finally {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  initData() {
    userEmail = Get.arguments["email"];
  }

  @override
  void onInit() {
    authStateLisener();
    initData();
    super.onInit();
  }
}
