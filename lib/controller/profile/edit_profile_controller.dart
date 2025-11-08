import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ourcommunity/controller/home/home_page_controller.dart';
import 'package:ourcommunity/controller/profile/profile_page_controller.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/functions/upload_images.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/data/model/user_model.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class EditProfileController extends GetxController {
  void initData();
  void selectCity(String city);
  void selectNeighborhood(String neighborhood);
  Future<void> pickeImage();
  void statusreqest(Statusreqest status);
  void showNeighborhood();
  Future<void> updateUserData();
  void changeData();
}

class EditProfileControllerImp extends EditProfileController {
  late TextEditingController nameController;
  late TextEditingController ageController;
  Statusreqest statusR = Statusreqest.success;
  bool showneighborhood = true;
  UserModel? userModel;
  UserData userData = UserData();
  Services services = Get.find();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initData() {
    userModel = Get.arguments['user_model'];
    nameController = TextEditingController(text: userModel!.name);
    ageController = TextEditingController(text: userModel!.age.toString());
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  Future<void> pickeImage() async {
    statusreqest(Statusreqest.loading);

    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );

    if (picked != null) {
      try {
        final file = File(picked.path);
        final uploadPreset = 'team_logo';
        final imageUrl = await uploadFileToCloudinary(file, uploadPreset);
        if (imageUrl != null) {
          userModel = userModel!.copyWith(photo: imageUrl);
        } else {
          showCustomSnackBar('Logo failed to load, please try again.');
        }
        statusreqest(Statusreqest.success);
      } catch (e) {
        statusreqest(Statusreqest.success);
        showCustomSnackBar(e.toString());
      }
    }
  }

  @override
  void selectCity(String city) {
    userModel = userModel!.copyWith(city: city);
    showneighborhood = true;
    update();
  }

  @override
  void selectNeighborhood(String neighborhood) {
    userModel = userModel!.copyWith(city: neighborhood);
    update();
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  void showNeighborhood() {
    if (showneighborhood == true) {
      showneighborhood = false;
    } else {
      showneighborhood = true;
    }

    update();
  }

  @override
  Future<void> updateUserData() async {
    try {
      if (key.currentState!.validate()) {
        statusreqest(Statusreqest.loading);
        final String useUid =
            services.sharedPreferences.getString(SharedKeys.userUid)!;
        changeData();
        await userData.updateUserData(userModel: userModel!, userUid: useUid);
        statusreqest(Statusreqest.success);
        Get.toNamed(AppRoutes.homePage);
      }
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
      showCustomSnackBar(e.toString());
    }
  }

  @override
  void changeData() {
    try {
      final String name = nameController.text.trim();
      final int age = int.parse(ageController.text.trim());
      userModel = userModel!.copyWith(
        age: age,
        name: name,
      );
    } on FormatException catch (e) {
      showCustomSnackBar(e.toString());
      log(e.message);
    }
  }
}
