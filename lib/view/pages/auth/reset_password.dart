import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../core/constant/Approutes.dart';
import '../../widgets/auth/authbuttom.dart';
import '../../widgets/auth/customimagewidget.dart';
import '../../widgets/auth/customtextfield.dart';
import '../../widgets/auth/customtitlewidget.dart';


class ResetPasswordPage extends StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/backgroundimage.png"), // change path if needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CustomImageWidget(imagePath: "asset/images/resetpassword.webp"),

                    SizedBox(height: 5.h),
                    const CustomTitleWidget(title:  "Reset Password"),

                    const SizedBox(height: 20),
                    // New Password
                    /// Password
                     CustomTextField(
                      
                      hint: "Password",
                      icon: Icons.lock,
                      obscure: true,
                      suffix: Icons.visibility,
                            validator: (value) => validateField(value!),
                    ),
                    const SizedBox(height: 16),
                    /// Password
                     CustomTextField(
                      hint:"Confirm Password",
                      icon: Icons.lock,
                      obscure: true,
                      suffix: Icons.visibility,
                              validator: (value) => validateField(value!),
                    ),

                    const SizedBox(height: 24),
                    // Confirm Button
                    CustomAuthButton(label:  "Confirm", onPressed: () { Get.toNamed(AppRoutes.loginPage); },),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
