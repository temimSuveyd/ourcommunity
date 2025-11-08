import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/functions/upload_images.dart';
import 'package:ourcommunity/data/dataScore/remote/category_data.dart';
import 'package:ourcommunity/data/dataScore/remote/event_data.dart';
import 'package:ourcommunity/data/dataScore/remote/team_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';
import 'package:ourcommunity/core/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide MultipartFile;

abstract class CreateEventController extends GetxController {
  void statusreqest(Statusreqest status);
  selectStartDate();
  selectEndDate();
  selectGovernorate(String governorate);
  selectCity(String city);
  selectCategory(int id, String name);
  selectTeam(int team, String name);
  selectGender(String gender);
  selectAgeGroup(String ageGroup);
  getAllCategoryes();
  getUserDataById();
  getTeamById();
  showGovernorate();
}

class CreateEventControllerImp extends CreateEventController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final capacityController = TextEditingController();
  final priceController = TextEditingController(text: "0");
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now().add(Duration(days: 1));
  String? selectedGovernorate;
  String? selectedCity;
  String? selectedGender;
  String? selectedAgeGroup;
  String? categoryName;
  String? teamName;
  String? userName;
  String? userPhoto;
  String? paymetState;
  int? selectedCategoryId;
  int? selectedTeamId;
  int? userId;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  Statusreqest statusR = Statusreqest.success;
  bool showArea = false;
  String? coverImage;
  final EventData eventData = EventData();
  final CategoryDate categoryDate = CategoryDate();
  final UserData userData = UserData();
  final TeamData teamData = TeamData();
  List<Map<String, dynamic>> categoryList = [];
  List<Map<String, dynamic>> userDataList = [];
  List<Map<String, dynamic>> teamDataList = [];
  Services services = Get.find();

  void createEvent() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedGovernorate == null ||
        selectedCategoryId == null ||
        capacityController.text.isEmpty ||
        selectedAgeGroup == null ||
        selectedGender == null ||
        selectedTeamId == null ||
        coverImage == null ||
        key.currentState!.validate() != true) {
      showCustomSnackBar("please enter all information");
      return;
    } else {
      try {
        statusreqest(Statusreqest.loading);
        final String title = titleController.text;
        final String description = descriptionController.text;
        final int capacity = int.parse(capacityController.text);
        final String startDateStr =
            "${selectedStartDate.year.toString().padLeft(4, '0')}-${selectedStartDate.month.toString().padLeft(2, '0')}-${selectedStartDate.day.toString().padLeft(2, '0')} ${selectedStartDate.hour.toString().padLeft(2, '0')}:${selectedStartDate.minute.toString().padLeft(2, '0')}:${selectedStartDate.second.toString().padLeft(2, '0')}";
        final String endDateStr =
            "${selectedEndDate.year.toString().padLeft(4, '0')}-${selectedEndDate.month.toString().padLeft(2, '0')}-${selectedEndDate.day.toString().padLeft(2, '0')} ${selectedEndDate.hour.toString().padLeft(2, '0')}:${selectedEndDate.minute.toString().padLeft(2, '0')}:${selectedEndDate.second.toString().padLeft(2, '0')}";
        final int price = int.parse(priceController.text);

        if (price <= 0) {
          paymetState = "All";
        } else {
          paymetState = "Paid";
        }
        final res = await eventData.addEvent(EventModel(
          title: title,
          description: description,
          photo: coverImage,
          startDate: startDateStr,
          endDate: endDateStr,
          city: selectedCity,
          categoryId: selectedCategoryId,
          teamId: selectedTeamId,
          governorate: selectedGovernorate,
          numberOfPraticipants: capacity,
          userId: userId,
          price: price,
          ageGroup: selectedAgeGroup,
          gender: selectedGender,
          categoryName: categoryName,
          teamName: teamName,
          userName: userName,
          userPhoto: userPhoto,
          paymetState: paymetState,
          sharedDate: DateTime.now(),
        ));
        statusreqest(Statusreqest.success);
        showCustomSnackBar("The event has been added successfully.");
        Get.back();
      } on PostgrestException catch (e) {
        showCustomSnackBar(e.message);
        statusreqest(Statusreqest.success);
      } catch (e) {
        showCustomSnackBar(e.toString());
        log(e.toString());
        statusreqest(Statusreqest.success);
      }
    }
  }

  Future<void> pickImage() async {
    statusreqest(Statusreqest.loading);

    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );

    if (picked != null) {
      try {
        final file = File(picked.path);
        final uploadPreset = 'events_images';
        final imageUrl = await uploadFileToCloudinary(file, uploadPreset);
        if (imageUrl != null) {
          coverImage = imageUrl;
          statusreqest(Statusreqest.success);
        } else {
          statusreqest(Statusreqest.faliure);
        }
      } catch (e) {
        statusreqest(Statusreqest.faliure);
      }
    }
  }

  @override
  selectCity(String city) {
    selectedCity = city;
    showArea = true;
    update();
  }

  @override
  selectGovernorate(String governorate) {
    selectedGovernorate = governorate;
    update();
  }

  @override
  Future<void> selectEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Appcolor.primarycolor, // Primary color
              onPrimary: Colors.white, // Text on header
              onSurface: Appcolor.black, // Text on calendar
            ),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Appcolor.primarycolor, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      selectedEndDate = picked;
    }
    update();
  }

  @override
  Future<void> selectStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Appcolor.primarycolor, // Primary color
              onPrimary: Colors.white, // Text on header
              onSurface: Appcolor.black, // Text on calendar
            ),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Appcolor.primarycolor, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      selectedStartDate = picked;
    }
    update();
  }

  @override
  selectCategory(int id, String name) {
    selectedCategoryId = id;
    categoryName = name;
    update();
  }

  @override
  selectTeam(int team, String name) {
    selectedTeamId = team;
    teamName = name;
    update();
  }

  @override
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  getAllCategoryes() {
    try {
      statusreqest(Statusreqest.loading);
      categoryDate.getCategories().then(
        (value) {
          if (value.isEmpty) {
            statusreqest(Statusreqest.faliure);
          } else {
            categoryList = value;
            statusreqest(Statusreqest.success);
          }
        },
      );
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    }
  }

  @override
  getUserDataById() async {
    try {
      final String userUid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      statusreqest(Statusreqest.loading);
      final res = await userData.getUserDataByuid(userUid);
      if (res.isEmpty) {
        statusreqest(Statusreqest.faliure);
      } else {
        userDataList = res;
        final String city = userDataList.first['profile_data']['city'];
        final String governorate =
            userDataList.first['profile_data']['neighborhood'];
        final String name = userDataList.first['profile_data']['name'];
        // final String photo = userDataList.first['profile_data']['user_photo'];

        final int id = userDataList.first["id"];
        userName = name;
        userPhoto = "photo";
        userId = id;
        selectCity(city);
        selectGovernorate(governorate);
        statusreqest(Statusreqest.success);
      }
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    }
  }

  @override
  getTeamById() async {
    try {
      statusreqest(Statusreqest.loading);
      final res = await teamData.getTeamsByBuilderId(userId!);
      if (res.isEmpty) {
        statusreqest(Statusreqest.faliure);
      } else {
        teamDataList = res;
        statusreqest(Statusreqest.success);
      }
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    } catch (e) {
      statusreqest(Statusreqest.success);
    }
  }

  @override
  showGovernorate() {
    if (showArea == true) {
      showArea = false;
    } else {
      showArea = true;
    }
    update();
  }

  @override
  void onInit() async {
    await getAllCategoryes();
    await getUserDataById();
    await getTeamById();
    super.onInit();
  }

  @override
  selectAgeGroup(String ageGroup) {
    selectedAgeGroup = ageGroup;
    update();
  }

  @override
  selectGender(String gender) {
    selectedGender = gender;
    update();
  }
}
