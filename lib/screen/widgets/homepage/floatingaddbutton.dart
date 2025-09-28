// ✅ زر الإضافة
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/constant/Approutes.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(Approutes.createEventPage);
      },
      shape: const CircleBorder(),
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}