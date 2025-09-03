import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/auth/logincontroller.dart';
import 'package:ourcommunity/controller/auth/sighupcontroller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/color.dart';

import '../../widgets/auth/backbuttom.dart';
import '../../widgets/auth/backgroundimage.dart';
import '../../widgets/auth/customRegisterAgreementText.dart';
import '../../widgets/auth/customtextfield.dart';
import '../../widgets/auth/ordivider.dart';
import '../../widgets/auth/socailbuttom.dart';
import '../../widgets/auth/authbuttom.dart';
import '../../widgets/auth/authredirecttext.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Background

          BackgroundImageWidget(),

          /// 🔹 Back Button
          const CustomBackButton(),

          /// 🔹 White Container with Form
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.80,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: const _RegisterForm(),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Register Form Widget
class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataView(
          status: controller.status,
          widget: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade600,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                /// user name
                CustomTextField(
                  controller: controller.nameController,
                  hint: "Username",
                  icon: Icons.person_outline,
                ),

                /// Username
                const SizedBox(height: 20),
                //  email
                CustomTextField(
                  controller: controller.emailController,
                  hint: "Email",
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: 20),

                /// Password
                CustomTextField(
                  controller: controller.passwordController,
                  hint: "Password",
                  icon: Icons.lock_open_outlined,
                  obscure: controller.obscurePassword.value,
                  suffix: controller.obscurePassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.togglePasswordVisibility();
                  },
                ),
                const SizedBox(height: 20),

                /// Confirm Password
                CustomTextField(
                  controller: controller.confirmPasswordController,
                  hint: "Confirm Password",
                  icon: Icons.lock_open_outlined,
                  obscure: controller.obscureConfirmPassword.value,
                  suffix: controller.obscureConfirmPassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.toggleConfirmPasswordVisibility();
                  },
                ),
                SizedBox(height: 20.sp),

                const CustomRegisterAgreementText(),

                SizedBox(height: 20.sp),

                /// زر Create Account
                CustomAuthButton(
                  label: "Create Account",
                  onPressed: () => controller.signUp(),
                ),

                const SizedBox(height: 25),

                /// Divider OR
                const OrDivider(),

                const SizedBox(height: 20),

                /// Social buttons
                const SocialButtons(),

                const SizedBox(height: 25),

                /// Already have account
                RegisterRedirectText(
                  message: "Already have an account? ",
                  actionText: "Login",
                  route: Approutes.loginPage,
                  actionColor: Appcolor.primarycolor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
