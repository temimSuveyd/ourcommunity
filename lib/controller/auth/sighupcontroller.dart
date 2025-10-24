import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/dataBase_keys.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignUpController extends GetxController {
  void togglePasswordVisibility();
  void toggleConfirmPasswordVisibility();
  void signUp();
  void signUpWithGoogle();
  void signUpWithEmail();
  void statusreqest(Statusreqest status);
  void changeCity(String city);
  void changeneighborhood(String neighborhood);
  void showNeighborhood();
  Future saveDataLocal(String userUid);
  Future addUserDataToDatabase(String userId);
}

class SignUpControllerImp extends SignUpController {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Statusreqest statusR = Statusreqest.success;
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;
  String? cityName;
  String? neighborhoodName;
  bool showneighborhood = false;
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
    update();
  }

  @override
  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
    update();
  }

  @override
  Future<void> signUpWithEmail() async {
    if (key.currentState!.validate()) {
      try {
        statusreqest(Statusreqest.loading);
        if (passwordController.text != confirmPasswordController.text) {
          showCustomSnackBar('كلمات المرور غير متطابقة');
          return;
        }
        final res = await supabase.auth.signUp(
          password: passwordController.text.trim(),
          email: emailController.text.trim(),
        );
        if (res.user != null) {
          final String userId = res.user!.id;
          await saveDataLocal(userId);
          await addUserDataToDatabase(userId);
          Get.toNamed(AppRoutes.emailWaitingPage, arguments: {
            "email": emailController.text.trim(),
          });
        }
      } on AuthApiException catch (e) {
        showCustomSnackBar(e.message);
        statusreqest(Statusreqest.success);
      } catch (e) {
        showCustomSnackBar('حدث خطأ');
        statusreqest(Statusreqest.success);
      }
    }
  }

  @override
  Future<void> signUpWithGoogle() async {
    try {
      statusreqest(Statusreqest.loading);

      final res = await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: DatabaseKeys.redirectTo,
      );
      final user = supabase.auth.currentUser;
      final userId = user?.id;

      log('Google userId: $userId');
      log(res.toString());
      // Get.offAllNamed(Approutes.homePage);
    } on AuthApiException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    } catch (e) {
      showCustomSnackBar('حدث خطأ');
      statusreqest(Statusreqest.success);
    } finally {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  void signUp() {
    signUpWithEmail();
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  void changeCity(String city) {
    cityName = city;
    showneighborhood = true;
    update();
  }

  @override
  void changeneighborhood(String neighborhood) {
    neighborhoodName = neighborhood;
    update();
  }

  @override
  Future saveDataLocal(String userUid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(SharedKeys.userUid, userUid);
    pref.setBool(SharedKeys.isLogin, true);
  }

  @override
  Future addUserDataToDatabase(String userId) async {
    try {
      final res = await supabase.from('users').insert({
        "profile_data": {
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'age': int.parse(ageController.text.trim()),
          'city': cityName,
          'neighborhood': neighborhoodName,
          'user_id': userId,
        },
      });
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  void showNeighborhood() {
    if (showneighborhood == true) {
      showneighborhood = false;
    } else {
      showneighborhood = true;
    }
    update();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
