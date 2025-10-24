import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/data/dataScore/remote/category_data.dart';
import 'package:ourcommunity/data/dataScore/remote/event_data.dart';
import 'package:ourcommunity/data/dataScore/remote/team_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';
import 'package:ourcommunity/services/servieses.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CreateEventController extends GetxController {
  void statusreqest(Statusreqest status);
  selectStartDate();
  selectEndDate();
  selectGovernorate(String governorate);
  selectCity(String city);
  selectEventCategory(int type);
  selectTeam(int team);
  getAllCategoryes();
  getUserDataById();
  getTeamByBuilderId();
  showGovernorate();
}

class CreateEventControllerImp extends CreateEventController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final capacityController = TextEditingController();
  var selectedStartDate = DateTime.now();
  var selectedEndDate = DateTime.now();
  String? selectedGovernorate;
  String? selectedCity;
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
        selectedTeamId == null ||
        coverImage == null) {
      showCustomSnackBar("please enter all information");
      return;
    } else {
      try {
        statusreqest(Statusreqest.loading);
        final String title = titleController.text;
        final String description = descriptionController.text;
        final int capacity = int.parse(capacityController.text);

        // Convert DateTime to ISO8601 String to avoid encoding error
        final String startDateStr = selectedStartDate.toIso8601String();
        final String endDateStr = selectedEndDate.toIso8601String();
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
        ));
        statusreqest(Statusreqest.success);
        showCustomSnackBar("The event has been added successfully.");
        Get.back();
      } on PostgrestException catch (e) {
        showCustomSnackBar(e.message);
        statusreqest(Statusreqest.success);
      }
    }
  }

  Future<void> pickImage() async {
    statusreqest(Statusreqest.loading);

    final picked = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);

    if (picked != null) {
      try {
        final bytes = await picked.readAsBytes();
        final supabase = Supabase.instance.client;
        final bucket = 'events_images';
        final originalName = picked.name;
        final extension = originalName.split('.').last;
        final baseName = originalName.split('.').first;
        // Benzersiz bir isim oluşturmak için zamana veya random'a dayalı değer ekle
        final uniqueSuffix = DateTime.now().millisecondsSinceEpoch.toString();
        final safeName =
            '${baseName.toLowerCase().replaceAll(RegExp(r'[^\w]+'), '_')}_$uniqueSuffix.$extension';

        await supabase.storage.from(bucket).uploadBinary(
            'uploads/$safeName', bytes,
            fileOptions: const FileOptions(upsert: true));
        final publicUrl =
            supabase.storage.from(bucket).getPublicUrl('uploads/$safeName');
        coverImage = publicUrl;
        statusreqest(Statusreqest.success);
      } on StorageException catch (e) {
        showCustomSnackBar(e.message);
        statusreqest(Statusreqest.success);
      } catch (e) {
        showCustomSnackBar(e.toString());
        statusreqest(Statusreqest.faliure);
      }
    } else {
      statusreqest(Statusreqest.faliure);
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
      initialDate: selectedEndDate,
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
      initialDate: selectedStartDate,
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
      locale: const Locale('ar', ''), // Optional: for Arabic locale support
    );
    if (picked != null) {
      selectedStartDate = picked;
    }
    update();
  }

  @override
  selectEventCategory(int id) {
    selectedCategoryId = id;
    update();
  }

  @override
  selectTeam(int team) {
    selectedTeamId = team;
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
            statusreqest(Statusreqest.noData);
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
  getUserDataById() {
    try {
      final String userUid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      statusreqest(Statusreqest.loading);
      userData.getUserDataById(userUid).then(
        (value) {
          if (value.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            userDataList = value;
            final String city = userDataList.first['profile_data']['city'];
            final String governorate =
                userDataList.first['profile_data']['neighborhood'];
            final int id = userDataList.first["id"] ?? 14;
            selectCity(city);
            selectGovernorate(governorate);
            userId = id;
            getTeamByBuilderId();
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
  getTeamByBuilderId() {
    try {
      statusreqest(Statusreqest.loading);
      teamData.getTeamsByBuilderId(userId!).then(
        (value) {
          if (value.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            teamDataList = value;
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
  showGovernorate() {
    if (showArea == true) {
      showArea = false;
    } else {
      showArea = true;
    }
    update();
  }

  @override
  void onInit() {
    getAllCategoryes();
    getUserDataById();
    super.onInit();
  }
}
