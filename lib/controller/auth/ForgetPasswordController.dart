import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';

abstract class Forgetpasswordcontroller extends GetxController {
  void sendMessage();
  void statusreqest(Statusreqest _status);
}

class ForgetPasswordControllerImpl extends Forgetpasswordcontroller {
  final emailController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Statusreqest status = Statusreqest.success;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void sendMessage() async {
    statusreqest(Statusreqest.loading);
    try {
      await auth.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      showCustomSnackBar(
          "The password reset link was sent to your e-mail address.");
      Get.toNamed(Approutes.loginPage);
      statusreqest(Statusreqest.success);
    } on FirebaseAuthException catch (e) {
      showCustomSnackBar(e.message ?? 'An error occurred');
      statusreqest(Statusreqest.success);
    } catch (e) {
      showCustomSnackBar('An error occurred');
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  void statusreqest(Statusreqest _status) {
    status = _status;
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
