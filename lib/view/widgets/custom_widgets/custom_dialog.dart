import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';

Future<bool> customDialog(
    String title, String middleText, String confirm, String cancel) async {
  bool? status;
  await Get.defaultDialog(
    title: title,
    middleText: middleText,

    textCancel: cancel,
    textConfirm: confirm,
    cancelTextColor: Appcolor.primarycolor,
    confirmTextColor: Appcolor.colorbackground,
    buttonColor: Appcolor.primarycolor,
    onConfirm: () {
      status = true;
      Get.back();
    },
    onCancel: () {
      status = false;
    },
 
 
  );
  return status!;
}
