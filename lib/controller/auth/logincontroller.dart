import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';


abstract class SignInController extends GetxController {
  void togglePasswordVisibility();
  void signIn();
  void signInWithGoogle();
  void signInWithEmail();
  void statusreqest(Statusreqest _status);
}

class SignInControllerImp extends SignInController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Statusreqest status = Statusreqest.success;
  var obscurePassword = true.obs;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
    update();
  }

  @override
  Future<void> signInWithEmail() async {
    try {
      statusreqest(Statusreqest.loading);
      await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      Get.offAllNamed(Approutes.homePage);
            showCustomSnackBar("Welcome");
    } on FirebaseAuthException catch (e) {
      showCustomSnackBar(e.message ?? 'An error occurred');
      statusreqest(Statusreqest.success);
    } catch (e) {
      showCustomSnackBar('An error occurred');
      statusreqest(Statusreqest.success);
    } finally {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      statusreqest(Statusreqest.loading);

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await auth.signInWithCredential(credential);
    } catch (e) {
     showCustomSnackBar(e.toString());
    } finally {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  void signIn() {
    signInWithEmail();
  }

  @override
  void statusreqest(Statusreqest _status) {
    status = _status;
    update();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
