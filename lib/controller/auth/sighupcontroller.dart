import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';


abstract class SignUpController extends GetxController {
  void togglePasswordVisibility();
  void toggleConfirmPasswordVisibility();
  void signUp();
  void signUpWithGoogle();
  void signUpWithEmail();
  void statusreqest(Statusreqest _status);
}

class SignUpControllerImp extends SignUpController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Statusreqest status = Statusreqest.success;
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  final GoogleSignIn googlesignUp = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

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
    try {
      statusreqest(Statusreqest.loading);
      if (passwordController.text != confirmPasswordController.text) {
        showCustomSnackBar('Passwords do not match');
        return;
      }

      await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      // Get.offAllNamed(Approutes.homePage); // Navigate to home screen
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
  Future<void> signUpWithGoogle() async {
    try {
      statusreqest(Statusreqest.loading);

      final GoogleSignInAccount? googleUser = await googlesignUp.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await auth.signInWithCredential(credential);
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in with Google');
    } finally {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  void signUp() {
    signUpWithEmail();
  }

  @override
  void statusreqest(Statusreqest _status) {
    status = _status;
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
