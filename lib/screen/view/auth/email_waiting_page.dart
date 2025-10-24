import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/auth/waiting_emailController.dart';
import '../../widgets/auth/backgroundimage.dart';
import '../../widgets/auth/customimagewidget.dart';

class EmailWaitingPage extends StatelessWidget {
  const EmailWaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => WaitingEmailcontrollerImpl(),
    );

    return Scaffold(
      body: Stack(
        children: [
          /// 🔹 Background

          BackgroundImageWidget(),
          // ✅ Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ✅ Illustration
                    const CustomImageWidget(
                        imagePath: "asset/images/email.png"),

                    // ✅ Title
                    Text(
                      "قم بتأكيد عنوان بريدك الإلكتروني",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // ✅ Subtitle
                    Text(
                      "لقد أرسلنا رسالة تأكيد إلى بريدك الإلكتروني، الرجاء التحقق والموافقة لإكمال التسجيل.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5.h),

                    // ✅ User email
                    GetBuilder<WaitingEmailcontrollerImpl>(
                      builder: (controller) => Text(
                        controller.userEmail ?? "haveError",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ),
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
