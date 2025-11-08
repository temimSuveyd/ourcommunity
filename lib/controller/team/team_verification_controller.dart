import 'package:get/get.dart';

class TeamVerificationController extends GetxController {
  var selectedFile = "".obs;

  // اختيار الملف (مؤقت – تقدر تربطه بـ FilePicker)
  void pickFile() {
    // TODO: استخدم FilePicker أو ImagePicker
    selectedFile.value = "document.pdf"; // مثال
  }

  // إرسال الطلب
  void submitVerification() {
    if (selectedFile.isNotEmpty) {
      Get.snackbar(
        "تم الإرسال",
        "تم إرسال طلب توثيق الفريق بنجاح",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.primaryColor,
        colorText: Get.theme.colorScheme.onPrimary,
      );
    } else {
      Get.snackbar(
        "خطأ",
        "يرجى اختيار ملف أولاً",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    }
  }
}
