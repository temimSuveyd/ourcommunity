import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignInController extends GetxController {
  void togglePasswordVisibility();
  void signIn();
  void signInWithGoogle();
  void signInWithEmail();
  void statusreqest(Statusreqest status);
  Future saveDataLocal(String userUid);
}

class SignInControllerImp extends SignInController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Statusreqest statusR = Statusreqest.success;
  var obscurePassword = true.obs;
  final SupabaseClient supabase = Supabase.instance.client;
  Services services = Get.find();
  @override
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
    update();
  }

  @override
  Future<void> signInWithEmail() async {
    if (key.currentState!.validate()) {
      try {
        statusreqest(Statusreqest.loading);
        final AuthResponse res = await supabase.auth.signInWithPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        final userId = res.user!.id;

        if (res.user?.id != null && res.session != null) {
          saveDataLocal(userId);
          Get.offAllNamed(AppRoutes.homePage);
          showCustomSnackBar("Welcome");
        }
      } on AuthApiException catch (e) {
        showCustomSnackBar(e.message);
        statusreqest(Statusreqest.success);
      } finally {
        statusreqest(Statusreqest.success);
      }
    }
  }

  @override
  Future saveDataLocal(String userUid) async {
    final pref = services.sharedPreferences;
    pref.setString(SharedKeys.userUid, userUid);
    pref.setBool(SharedKeys.isLogin, true);
  }

  @override
  Future<void> signInWithGoogle() async {
    // try {
    //   statusreqest(Statusreqest.loading);

    //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    //   if (googleUser == null) return;

    //   final GoogleSignInAuthentication googleAuth =
    //       await googleUser.authentication;
    //   final credential = GoogleAuthProvider.credential(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );
    //   await auth.signInWithCredential(credential);
    // } catch (e) {
    //  showCustomSnackBar(e.toString());
    // } finally {
    //   statusreqest(Statusreqest.success);
    // }
  }

  @override
  void signIn() {
    signInWithEmail();
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
