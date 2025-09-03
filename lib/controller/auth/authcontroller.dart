import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.snackbar("Success", "Login successful!");
  }

  void signup() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.snackbar("Success", "Account created!");
  }
}