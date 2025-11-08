import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final Widget? child; // محتوى الصفحة اللي هيظهر فوق الخلفية

  const BackgroundImageWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 🔹 خلفية الصورة
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/backgroundimage.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// 🔹 محتوى الصفحة
        if (child != null) child!,
      ],
    );
  }
}
