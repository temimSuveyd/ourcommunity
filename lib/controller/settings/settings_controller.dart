import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SettingsController extends GetxController {
  void chooseDarkMode();
  void initTheme();
  void showLanguagesDialog();
  void sendChangePasswordUrl();
}

class SettingsControllerImp extends SettingsController {
  bool? isDarkMode;
  Services services = Get.find();
  SupabaseClient supabase = Supabase.instance.client;
  @override
  void chooseDarkMode() {
    isDarkMode = !isDarkMode!;
    final perf = services.sharedPreferences;
    perf.setBool(SharedKeys.isDarkMode, isDarkMode!);
    if (isDarkMode!) {
      Appcolor.backgroundColor = Appcolor.darkThemeBackground;
      Appcolor.primarTextcolor = Colors.white;
      Appcolor.secondTextcolor = Colors.blueGrey.shade50;
      Appcolor.cardColor = const Color.fromARGB(255, 37, 37, 37);
    } else {
      Appcolor.backgroundColor = Appcolor.lighetThemeBackground;
      Appcolor.primarTextcolor = Colors.black87;
      Appcolor.secondTextcolor = Colors.blueGrey;
      Appcolor.cardColor = Appcolor.backgroundColor;
    }
    Get.toNamed(AppRoutes.homePage);
    update();
  }

  @override
  void initTheme() {
    final perf = services.sharedPreferences;
    final bool isDark = perf.getBool(SharedKeys.isDarkMode) ?? false;
    isDarkMode = isDark;
    if (isDarkMode!) {
      Appcolor.backgroundColor = Appcolor.darkThemeBackground;
      Appcolor.primarTextcolor = Colors.white;
      Appcolor.secondTextcolor = Colors.blueGrey.shade50;
      Appcolor.cardColor = const Color.fromARGB(255, 37, 37, 37);
    } else {
      Appcolor.backgroundColor = Appcolor.lighetThemeBackground;
      Appcolor.primarTextcolor = Colors.black87;
      Appcolor.secondTextcolor = Colors.blueGrey;
      Appcolor.cardColor = Appcolor.backgroundColor;
    }
    update();
  }

  @override
  void onInit() {
    initTheme();
    super.onInit();
  }

  @override
  void showLanguagesDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: Appcolor.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.language, color: Appcolor.primarycolor, size: 32),
              SizedBox(height: 14),
              Text(
                "Select Language",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  fontFamily: "cairo",
                  color: Appcolor.primarycolor,
                ),
              ),
              SizedBox(height: 18),
              Divider(color: Appcolor.primarycolor.withOpacity(0.15)),
              SimpleDialogOption(
                onPressed: () {
                  // ör: dil seçim işlemi
                  // dil ayarlama kodu gelsin
                  Get.back();
                },
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  children: [
                    Icon(Icons.flag, color: Appcolor.primarycolor, size: 22),
                    SizedBox(width: 10),
                    Text(
                      "English",
                      style: TextStyle(
                        color: Appcolor.secondTextcolor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // ör: dil seçim işlemi
                  Get.back();
                },
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  children: [
                    Icon(Icons.flag, color: Appcolor.primarycolor, size: 22),
                    SizedBox(width: 10),
                    Text(
                      "العربية",
                      style: TextStyle(
                        color: Appcolor.secondTextcolor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.18),
    );
  }

  @override
  Future<void> sendChangePasswordUrl() async {
    // Kullanıcıya şifre değiştirme bağlantısı göndermek için Supabase kullan
    try {
      final user = supabase.auth.currentUser;
      if (user != null && user.email != null) {
        await supabase.auth.resetPasswordForEmail(user.email!);
        showCustomSnackBar('Password reset link sent to your email.');
      } else {
        showCustomSnackBar('Could not find your email. Please try again.');
      }
    } catch (e) {
      showCustomSnackBar(
          'Failed to send password reset link. Please try again.');
    }
  }
}
