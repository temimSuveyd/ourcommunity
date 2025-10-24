import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourcommunity/core/constant/color.dart';

import '../socialicon.dart';

/// 🔹 Social Button (Google) - Modern, compact, primary color design
class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Appcolor.primarycolor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Appcolor.primarycolor.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SocialIcon("asset/images/google.png"),
                Text(
                  "تابع باستخدام جوجل",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
