import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/auth/login_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/functions/validateField.dart';
import '../../widgets/auth/authbuttom.dart';
import '../../widgets/auth/authredirecttext.dart';
import '../../widgets/auth/backbuttom.dart';
import '../../widgets/auth/backgroundimage.dart';
import '../../widgets/auth/customforgrttext.dart';
import '../../widgets/auth/customtextfield.dart';
import '../../widgets/auth/ordivider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignInControllerImp());
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Background
          BackgroundImageWidget(),

          // زر Back
          const CustomBackButton(),

          /// 🔹 White Container Content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.80,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: const _LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Login Form Widget
class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<SignInControllerImp>(
        builder: (controller) => HandlingDataView(
          status: controller.statusR,
          message: "",
          child: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5.h),

                /// Title
                Center(
                  child: Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                /// Username
                CustomTextField(
                    validator: (value) => validateField(
                        fieldType: "email",
                        maxWords: 30,
                        minWords: 5,
                        value: value),
                    controller: controller.emailController,
                    hint: "Email",
                    icon: Icons.person_outline),
                const SizedBox(height: 20),

                /// Password
                CustomTextField(
                  validator: (value) => validateField(
                      fieldType: "password",
                      maxWords: 100,
                      minWords: 8,
                      value: value),
                  controller: controller.passwordController,
                  hint: "Password",
                  icon: Icons.lock_outline,
                  obscure: controller.obscurePassword.value,
                  suffix: controller.obscurePassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () => controller.togglePasswordVisibility(),
                ),

                /// Forgot Password
                const SizedBox(height: 10),

                ///
                const ForgotPasswordLink(),

                const SizedBox(height: 20),

                /// Sign in Button
                CustomAuthButton(
                  label: "Sign in",
                  onPressed: () => controller.signIn(),
                ),

                SizedBox(height: 25.h),

                /// Divider
                const OrDivider(),

                const SizedBox(height: 20),
                /// Social Buttons
                // SocialButtons(onPressed: () => controller.signInWithGoogle()),
                const SizedBox(height: 25),

                /// Register Text
                const RegisterRedirectText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
