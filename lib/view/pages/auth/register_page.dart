import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/auth/sign_up_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/core/functions/validateField.dart';
import 'package:ourcommunity/data/dataScore/static/auth/citys_data.dart';
import 'package:ourcommunity/data/dataScore/static/auth/neighborhoodData.dart';
import 'package:ourcommunity/view/widgets/auth/dropdownButton.dart';

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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                    color: Appcolor.shadowColor,
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
          status: controller.statusR,
          child: Form(
            key: controller.key,
            child: Column(
              spacing: 20,
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
                const SizedBox(height: 5),

                /// Profile Picture Picker
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(controller.coverImage),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: InkWell(
                          onTap: () async {
                            await controller.pickImage();
                          },
                          borderRadius: BorderRadius.circular(22),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.blue.shade600,
                            child: Icon(
                              Icons.camera_alt_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                /// user name
                CustomTextField(
                  validator: (value) => validateField(
                      value: value,
                      fieldType: "name",
                      minWords: 2,
                      maxWords: 30),
                  keyboardType: TextInputType.name,
                  controller: controller.nameController,
                  hint: "Your Name",
                  icon: Icons.person_outline,
                ),
                // User age
                CustomTextField(
                  validator: (value) => validateField(
                      value: value, fieldType: "age", minWords: 1, maxWords: 2),
                  keyboardType: TextInputType.number,
                  controller: controller.ageController,
                  hint: "Your Age",
                  icon: Icons.cake_outlined,
                ),
                //  email
                CustomTextField(
                  validator: (value) => validateField(
                      value: value,
                      fieldType: "email",
                      minWords: 5,
                      maxWords: 50),
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  hint: "Email Address",
                  icon: Icons.email_outlined,
                ),

                /// Password
                CustomTextField(
                  validator: (value) => validateField(
                      value: value,
                      fieldType: "password",
                      minWords: 8,
                      maxWords: 32),
                  keyboardType: TextInputType.visiblePassword,
                  controller: controller.passwordController,
                  hint: "Password",
                  icon: Icons.password,
                  obscure: true,
                  suffix: Icons.visibility_off,
                  onPressed: () {
                    controller.togglePasswordVisibility();
                  },
                ),

                /// Confirm Password
                CustomTextField(
                  validator: (value) => validateField(
                      value: value,
                      fieldType: "password",
                      minWords: 8,
                      maxWords: 32),
                  keyboardType: TextInputType.visiblePassword,
                  controller: controller.confirmPasswordController,
                  hint: "Confirm Password",
                  icon: Icons.password,
                  obscure: controller.obscureConfirmPassword.value,
                  suffix: controller.obscureConfirmPassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressed: () {
                    controller.toggleConfirmPasswordVisibility();
                  },
                ),

                // DropdownButton for city selection
                CustomDropdownButton(
                  onTap: () => controller.showNeighborhood(),
                  hintText: controller.cityName ?? "Choose your city",
                  dataList: cities,
                  onChanged: (String city) {
                    controller.changeCity(city);
                  },
                ),

                // DropdownButton for neighbourhood selection
                if (controller.showneighborhood != false)
                  CustomDropdownButton(
                    hintText: "Select your neighborhood",
                    dataList: neighborhoods[controller.cityName] ?? [],
                    onChanged: (String mahalle) {
                      controller.changeneighborhood(mahalle);
                    },
                  ),

                const CustomRegisterAgreementText(),

                /// زر Create Account
                CustomAuthButton(
                  label: "Create Account",
                  onPressed: () => controller.signUp(),
                ),

                const SizedBox(height: 5),

                /// Divider OR
                const OrDivider(),

                /// Social buttons
                SocialButton(
                  onTap: () => controller.signUpWithGoogle(),
                ),

                const SizedBox(height: 5),

                /// Already have account
                RegisterRedirectText(
                  message: "Already have an account? ",
                  actionText: "Login",
                  route: AppRoutes.loginPage,
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
