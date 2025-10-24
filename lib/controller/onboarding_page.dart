import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/constant/Approutes.dart';
import '../data/dataScore/static/static.dart';
import '../services/servieses.dart';

abstract class Onboardingcontroller extends GetxController {
  next();
  back();
  onpagechanged(int index);
  Skip();
}

class OnboardingcontrollerImp extends Onboardingcontroller {
  int currentpage = 0;
  late PageController pagecontroller;
  Services services = Get.find();

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }

  @override
  void next() {
    if (currentpage == onboardinglist.length - 1) {
      // آخر صفحة ⇒ دخول للتطبيق
      services.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.welcomeBackUI);
    } else {
      currentpage++;
      pagecontroller.animateToPage(
        currentpage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      update();
    }
  }

  @override
  void back() {
    if (currentpage > 0) {
      currentpage--;
      pagecontroller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      update();
    }
  }

  @override
  void onpagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void Skip() {
    pagecontroller.jumpToPage(onboardinglist.length - 1);
    update();
  }
}
