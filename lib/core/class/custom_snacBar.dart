

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ourcommunity/core/constant/color.dart';

showCustomSnackBar(String message){
          ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content:  Text(
             message,
              style: const TextStyle(fontSize: 14), // yazı küçük
            ),
            backgroundColor: Appcolor.primarycolor,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.symmetric(
                horizontal: 80, vertical: 20), // küçült
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 8), // iç boşluk
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
}