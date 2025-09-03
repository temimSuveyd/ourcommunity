import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/auth/ForgetPasswordController.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import '../../widgets/auth/authbuttom.dart';
import '../../widgets/auth/backgroundimage.dart';
import '../../widgets/auth/customimagewidget.dart';
import '../../widgets/auth/customsubtitle.dart';
import '../../widgets/auth/customtextfield.dart';
import '../../widgets/auth/customtitlewidget.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => ForgetPasswordControllerImpl(),
    );
    return Scaffold(
      body: Stack(
        children: [
          /// الخلفية
          /// 🔹 Background
          BackgroundImageWidget(),

          /// الكونتينر في الوسط
          GetBuilder<ForgetPasswordControllerImpl>(
            builder: (controller) => Center(
              child: Container(
                width: Get.width * 0.85,
                height: Get.height * 0.70,
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 30.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: HandlingDataView(
                  status: controller.status,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomImageWidget(
                          imagePath: "asset/images/forgetpassword.jpg"),
                      SizedBox(height: 5.h),
                      const CustomTitleWidget(title: "Forgot Password?"),
                      const SizedBox(height: 10),
                      const CustomSubtitleWidget(
                        subtitle:
                            "Enter your email address to reset your password",
                      ),
                      const SizedBox(height: 25),
                      CustomTextField(
                        controller: controller.emailController,
                        hint: "Email",
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 25),
                      CustomAuthButton(
                        label: "Send Code",
                        onPressed: () => controller.sendMessage(),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
