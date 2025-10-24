import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';

class ForgetPasswordAppBar extends StatelessWidget {
  const ForgetPasswordAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.navigate_before,
                  color: Appcolor.white,
                  size: 40,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              Expanded(
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Appcolor.white,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 48), // IconButton kadar boş yer bırakmak için
            ],
          ),
        ),
      ),
    );
  }
}
