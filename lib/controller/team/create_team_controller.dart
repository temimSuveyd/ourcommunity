import 'dart:developer';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/functions/upload_images.dart';
import 'package:ourcommunity/core/params/team_params.dart';
import 'package:ourcommunity/data/dataScore/remote/category_data.dart';
import 'package:ourcommunity/data/dataScore/remote/team_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/data/model/team/team_model.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CreateTeamController extends GetxController {
  Future<void> getUserData();
  Future<void> getCategoryesData();
  Future<void> createTeam();
  void statusreqest(Statusreqest status);
  void selectCategory(int categoryId, String categoryName);
  void selectUserData();
  void setTeamData();
  void pickeImage();
  void addMemberToTeam();
}

class CreateTeamControllerImp extends CreateTeamController {
  List<Map<String, dynamic>> categoryDataList = [];
  List<Map<String, dynamic>> teamDataList = [];
  List<Map<String, dynamic>> userDataList = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController descrabtionController = TextEditingController();
  Statusreqest statusR = Statusreqest.success;
  UserData userData = UserData();
  CategoryDate categoryDate = CategoryDate();
  TeamData teamData = TeamData();
  Services services = Get.find();
  String? pickedImage;
  TeamModel teamModel = TeamModel();
  TeamParams teamParams = TeamParams();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Future<void> createTeam() async {
    try {
      statusreqest(Statusreqest.loading);
      setTeamData();
      final res = await teamData.addTeam(teamModel: teamModel);
      teamParams = teamParams.copyWith(teamId: res);
      addMemberToTeam();
      statusreqest(Statusreqest.success);
      Get.back();
      showCustomSnackBar("Team added successfully");
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
      log(e.message);
    } catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.toString());
    }
  }

  @override
  Future<void> getCategoryesData() async {
    try {
      statusreqest(Statusreqest.loading);
      final res = await categoryDate.getCategories();
      if (res.isEmpty) {
        statusreqest(Statusreqest.faliure);
      } else {
        categoryDataList = res;
        statusreqest(Statusreqest.success);
      }
    } catch (e) {
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  Future<void> getUserData() async {
    try {
      statusreqest(Statusreqest.loading);
      final String uid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      final res = await userData.getUserDataByuid(uid);
      if (res.isEmpty) {
        statusreqest(Statusreqest.faliure);
      } else {
        userDataList = res;
        selectUserData();
        statusreqest(Statusreqest.success);
      }
    } catch (e) {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  void selectCategory(int categoryId, String categoryName) {
    teamModel = teamModel.copyWith(categoryId: categoryId);
    teamModel = teamModel.copyWith(categoryName: categoryName);
  }

  @override
  void selectUserData() {
    final int id = userDataList.first['id'];
    final String name = userDataList.first['profile_data']['name'];
    final String photo = userDataList.first['profile_data']['photo'];
    teamModel = teamModel.copyWith(builderName: name, builderId: id);
    // team params
    teamParams = teamParams.copyWith(userId: id,userName: name,userPhoto: photo);
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
          teamModel = teamModel.copyWith(teamLogo: imageUrl);
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
  void setTeamData() {
    final name = nameController.text.trim();
    final descrabtion = descrabtionController.text.trim();
    teamModel = teamModel.copyWith(teamName: name, teamDescription: descrabtion);
  }

  @override
  Future<void> addMemberToTeam() async {
    try {
      statusreqest(Statusreqest.loading);
      teamParams = teamParams.copyWith(role: 'admin', joinedAt: DateTime.now(),);
      await teamData.addMemberToTeam(teamParams);
    } on PostgrestException catch (e) {
      statusreqest(Statusreqest.success);
      showCustomSnackBar(e.message);
    } catch (e) {
      statusreqest(Statusreqest.faliure);
      showCustomSnackBar(e.toString());
    }
  }

  @override
  void onInit() async {
    await getUserData();
    await getCategoryesData();
    super.onInit();
  }
}
