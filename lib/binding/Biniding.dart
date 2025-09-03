

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/onboarding_page.dart';
import '../services/servieses.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Services>(() => Services  (),fenix: true);
    ///////////////////user
    Get.lazyPut<OnboardingcontrollerImp>(() => OnboardingcontrollerImp (),fenix: true);
    Get.putAsync(() => Services().init());
  }
}
