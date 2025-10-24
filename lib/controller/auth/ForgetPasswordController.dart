import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class Forgetpasswordcontroller extends GetxController {
  void sendMessage();
  void statusreqest(Statusreqest status);
}

class ForgetPasswordControllerImpl extends Forgetpasswordcontroller {
  final emailController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Statusreqest statusR = Statusreqest.success;
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  void sendMessage() async {
    statusreqest(Statusreqest.loading);
    try {
      final email = emailController.text.trim();
      final res = await supabase.auth.resetPasswordForEmail(
        email,
      );
      showCustomSnackBar(
          "The password reset link was sent to your e-mail ($email) address.");
      Get.toNamed(AppRoutes.loginPage);
      statusreqest(Statusreqest.success);
    } on AuthApiException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    } catch (e) {
      showCustomSnackBar('An error occurred');
      statusreqest(Statusreqest.success);
    }
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
