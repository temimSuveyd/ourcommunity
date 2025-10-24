// ✅ زر الإضافة
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/Approutes.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(AppRoutes.createEventPage);
      },
      shape: const CircleBorder(),
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
