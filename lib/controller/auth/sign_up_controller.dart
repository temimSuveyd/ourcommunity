import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/dataBase_keys.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/functions/upload_images.dart';
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
  void chackignForAccountStat();
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
  String coverImage =
      'https://th.bing.com/th/id/OIP.dILKQaE2Zomd33DK3_HdPAAAAA?o=7&cb=ucfimgc2rm=3&rs=1&pid=ImgDetMain&o=7&rm=3';
  bool showneighborhood = false;
  bool? isAccountVerified;
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
          Get.toNamed(AppRoutes.loginPage);
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
      chackignForAccountStat();
      if (isAccountVerified == true) {
        Get.toNamed(AppRoutes.homePage);
      } else {
        showCustomSnackBar('Email is not Verified');
      }
    } on AuthApiException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    } catch (e) {
      showCustomSnackBar('An error occurred');
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
          'photo': coverImage,
        },
      });
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.faliure);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
      return null;
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

  @override
  chackignForAccountStat() {
    isAccountVerified = false;
    supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      if (event == AuthChangeEvent.signedIn && session != null) {
        final user = session.user;
        final isEmailVerified = user.emailConfirmedAt != null;
        isAccountVerified = isEmailVerified;
      }
    });
  }

  Future<void> pickImage() async {
    statusreqest(Statusreqest.loading);

    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );

    if (picked != null) {
      try {
        final file = File(picked.path);
        final uploadPreset = 'events_images';
        final imageUrl = await uploadFileToCloudinary(file, uploadPreset);
        if (imageUrl != null) {
          coverImage = imageUrl;
          statusreqest(Statusreqest.success);
        } else {
          statusreqest(Statusreqest.faliure);
        }
      } catch (e) {
        statusreqest(Statusreqest.faliure);
      }
    }
  }
}
