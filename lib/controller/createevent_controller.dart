import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final capacityController = TextEditingController();

  var selectedStartDate = DateTime.now().obs;
  var selectedEndDate = DateTime.now().obs;

  var selectedGovernorate = "".obs;
  var selectedArea = "".obs;
  var selectedCategory = "".obs;
  var selectedTeam = "".obs;

  final governorates = ["القاهرة", "الجيزة", "الإسكندرية"].obs;
  final areas = {
    "القاهرة": ["مدينة نصر", "المعادي", "حلوان"],
    "الجيزة": ["الهرم", "العجوزة", "الدقي"],
    "الإسكندرية": ["سيدي جابر", "العصافرة", "محرم بك"],
  };

  final categories = ["رياضية", "ثقافية", "تعليمية", "ترفيهية"].obs;
  final teams = ["فريق التطوير", "فريق الدعم", "فريق المتطوعين"].obs;



  Future<void> pickDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      if (isStart) {
        selectedStartDate.value = picked;
      } else {
        selectedEndDate.value = picked;
      }
    }
  }

  void createEvent() {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedGovernorate.value.isEmpty ||
        selectedArea.value.isEmpty ||
        selectedCategory.value.isEmpty ||
        capacityController.text.isEmpty ||
        selectedTeam.value.isEmpty) {
      Get.snackbar("خطأ", "الرجاء إدخال جميع الحقول المطلوبة");
      return;
    }

    Get.snackbar("تم", "تم إنشاء الفعالية: ${titleController.text}");
  }
  var coverImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      coverImage.value = File(picked.path);
    }
  }

}
