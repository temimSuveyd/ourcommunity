import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TeamController extends GetxController {
  // 0 = الأعضاء , 1 = الإعدادات
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}