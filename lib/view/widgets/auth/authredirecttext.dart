import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';

class RegisterRedirectText extends StatelessWidget {
  final String message;
  final String actionText;
  final String route;
  final Color actionColor;

  const RegisterRedirectText({
    super.key,
    this.message = "Don’t have an account? ",
    this.actionText = "Register",
    this.route = AppRoutes.registerPage,
    this.actionColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(route),
          child: Text(
            actionText,
            style: TextStyle(
              color: actionColor,
              fontWeight: FontWeight.normal,
              fontSize: 14
            ),
          ),
        ),
      ],
    );
  }
}
