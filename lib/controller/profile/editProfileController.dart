import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  // المتغيرات
  var name = "شيماء عمارة".obs;
  var email = "shymaa@example.com".obs;
  var phone = "01012345678".obs;

  // الكنترولرز للـ TextField
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController(text: name.value);
    emailController = TextEditingController(text: email.value);
    phoneController = TextEditingController(text: phone.value);
  }

  // حفظ التغييرات
  void saveChanges() {
    name.value = nameController.text;
    email.value = emailController.text;
    phone.value = phoneController.text;

    Get.snackbar(
      "تم الحفظ",
      "تم تحديث الملف الشخصي بنجاح",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.7),
      colorText: Colors.white,
    );
  }
}
