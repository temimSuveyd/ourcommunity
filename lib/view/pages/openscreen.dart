// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_page.dart';


class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const Onboarding());
    });

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Image.asset('asset/images/logo.png', width: 600,height: 500,), // شعار التطبيق
      ),
    );
  }
}
