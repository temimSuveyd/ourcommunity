import 'dart:developer';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/functions/upload_images.dart';
import 'package:ourcommunity/data/dataScore/remote/team_data.dart';
import 'package:ourcommunity/data/model/team/team_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class EditTeamInfoController extends GetxController {
  void initData();
  void statusreqest(Statusreqest status);
  Future<void> updateData();
  void setData();
  void pickeImage();
}

class EditTeamInfoControllerImp extends EditTeamInfoController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TeamModel? teamModel;
  Statusreqest statusR = Statusreqest.success;
  TeamData teamData = TeamData();

  @override
  void initData() {
    teamModel = Get.arguments['team_model'];
    nameController = TextEditingController(text: teamModel!.teamName);
    descController = TextEditingController(text: teamModel!.teamDescription);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  Future<void> updateData() async {
    try {
      statusreqest(Statusreqest.loading);
      setData();
      await teamData.updateTeamInfo(teamModel: teamModel!);
      statusreqest(Statusreqest.success);
      Get.toNamed(AppRoutes.quraaAldasmaPage, arguments: {
        'team_model': teamModel,
      });
      showCustomSnackBar('Team info updated');
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.toString());
    }
  }

  @override
  void setData() {
    final String name = nameController.text.trim();
    final String description = descController.text.trim();
    teamModel =
        teamModel!.copyWith(teamName: name, teamDescription: description);
  }

  @override
  void pickeImage() async {
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
          teamModel = teamModel!.copyWith(teamLogo: imageUrl);
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
}
