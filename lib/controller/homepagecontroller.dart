import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/sharedPreferences_constans.dart';
import 'package:ourcommunity/core/params/event_params.dart';
import 'package:ourcommunity/core/params/favorite_events_prams.dart';
import 'package:ourcommunity/data/dataScore/remote/category_data.dart';
import 'package:ourcommunity/data/dataScore/remote/event_data.dart';
import 'package:ourcommunity/data/dataScore/remote/favorite_events_data.dart';
import 'package:ourcommunity/data/dataScore/remote/team_data.dart';
import 'package:ourcommunity/data/dataScore/remote/user_data.dart';
import 'package:ourcommunity/screen/view/homepage/favourite.dart';
import 'package:ourcommunity/screen/view/homepage/homepagebody.dart';
import 'package:ourcommunity/screen/view/homepage/myEvents.dart';
import 'package:ourcommunity/screen/view/profile/profile.dart';
import 'package:ourcommunity/services/servieses.dart';
import 'package:string_similarity/string_similarity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class HomeController extends GetxController {
  void statusreqest(Statusreqest status);
  getUserDataById();
  getAllEvents();
  getTeamByBuilderId();
  getAllCategoryes();
  getFilteredEvents();
  setEventsType();
  serachInEvents();
  selectCity(String _city);
  selectPrice(String _price);
  selectCategory(int _categoryId, String name);
  selectTeam(int _teamId);
  selectAgeGroup(String _ageGroup);
  selectGender(String _gender);
  selectGovernorate(String _governorate);
  selecetEventState(String state);
  showGovernorate();
  toggleFavoriteEvent(int eventId);
  getAllFavoriteEvents();
  removeEventFromFavoriteList(int id);
  addEventToFavoriteList(int id);
}

class HomeControllerImp extends HomeController {
  Statusreqest statusR = Statusreqest.loading;
  Services services = Get.find();
  UserData userData = UserData();
  CategoryDate categoryDate = CategoryDate();
  EventData eventData = EventData();
  TeamData teamData = TeamData();
  FavoriteEventsData favoriteEventsData = FavoriteEventsData();
  List<Map<String, dynamic>> eventsList = [];
  List<int> favoriteEventsList = [];
  List<Map<String, dynamic>> userDataList = [];
  List<Map<String, dynamic>> categoryList = [];
  List<Map<String, dynamic>> teamDataList = [];

  TextEditingController serachController = TextEditingController();
  bool shwoGovernorate = false;
// deelete this data
  var currentIndex = 0;
  final List<Widget> pages = [
    const HomePageBody(),
    const FavoritePage(),
    const SizedBox(), // empty page
    const MyEventsPage(),
    const ProfilePage(),
  ];

  String price = "All";
  int categoryId = 0;
  int teamId = 0;
  String ageGroup = "All";
  String gender = "All";
  String? city;
  String governorate = "All";
  String eventState = "All";
  String categoryName = "All";
  int? userId;

  void resetFilters() {
    price = "All";
    categoryId = 0;
    teamId = 0;
    ageGroup = "All";
    gender = "All";
    city = "All";
    governorate = "All";
    getAllEvents();
  }

  void changePage(int index) {
    currentIndex = index;
    update();
  }

  @override
  getAllEvents() {
    try {
      statusreqest(Statusreqest.loading);

      eventData.getAllEvents(city!).listen(
        (value) {
          if (value.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            eventsList = value;
            statusreqest(Statusreqest.success);
          }
        },
      );
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  getAllFavoriteEvents() {
    try {
      statusreqest(Statusreqest.loading);
      favoriteEventsData.getAllFavoriteEventsIdAsStream(userId!).listen(
        (value) {
          if (value.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            favoriteEventsList = value;
            statusreqest(Statusreqest.success);
          }
        },
      );
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.faliure);
    }
  }

  @override
  getFilteredEvents() {
    try {
      statusreqest(Statusreqest.loading);
      EventParams params = EventParams(
          ageGroup: ageGroup,
          categoryId: categoryId,
          city: city,
          endDate: DateTime.now().toString(),
          gender: gender,
          governorate: governorate,
          price: price,
          startDate: DateTime.now().toString(),
          teamId: teamId,
          eventState: eventState);
      eventData.getFilteredEvents(params).listen(
        (value) {
          if (value.isEmpty) {
            statusreqest(Statusreqest.noData);
          } else {
            eventsList = value;
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
  void statusreqest(Statusreqest status) {
    statusR = status;
    update();
  }

  @override
  setEventsType() {
    if (price == "All" &&
        ageGroup == "All" &&
        gender == "All" &&
        governorate == "All" &&
        eventState == 'All' &&
        categoryId == 0 &&
        teamId == 0) {
      getAllEvents();
    } else {
      getFilteredEvents();
    }
  }

  @override
  Future getUserDataById() async {
    try {
      final String userUid =
          services.sharedPreferences.getString(SharedKeys.userUid)!;
      statusreqest(Statusreqest.loading);

      var res = await userData.getUserDataById(userUid);

      if (res.isEmpty) {
        statusreqest(Statusreqest.noData);
      } else {
        userDataList = res;
        final int id = userDataList.first["id"];
        final String _city = userDataList.first['profile_data']['city'];
        city = city ?? _city;
        userId = id;
        statusreqest(Statusreqest.success);
      }
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message);
      statusreqest(Statusreqest.success);
    }
  }

  @override
  selectCity(String _city) {
    city = _city;
    shwoGovernorate = true;
    update();
  }

  @override
  selectPrice(String _price) {
    price = _price;
    update();
  }

  @override
  selectCategory(int _categoryId, String name) {
    categoryId = _categoryId;
    categoryName = name;
    update();
  }

  @override
  selectTeam(int _teamId) {
    teamId = _teamId;
    update();
  }

  @override
  selectAgeGroup(String _ageGroup) {
    ageGroup = _ageGroup;
    update();
  }

  @override
  selectGender(String _gender) {
    gender = _gender;
    update();
  }

  @override
  selectGovernorate(String _governorate) {
    governorate = _governorate;
    update();
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
  void serachInEvents() {
    String query = serachController.text.trim().toLowerCase();

    if (query.isEmpty) {
      getAllEvents();
      return;
    }

    List<String> queryWords = query.split(' ');

    eventsList = eventsList.where((event) {
      final title = event["title"]?.toString().toLowerCase() ?? '';
      final description = event["description"]?.toString().toLowerCase() ?? '';
      final combinedText = '$title $description';
      final combinedWords = combinedText.split(' ');

      // Her query kelimesi için en az bir güçlü eşleşme olmalı
      bool AllQueryWordsMatch = queryWords.every((queryWord) {
        return combinedWords.any((word) {
          double score = StringSimilarity.compareTwoStrings(word, queryWord);
          return score > 0.75; // eşik değeri yükseltildi
        });
      });

      return AllQueryWordsMatch;
    }).toList();

    update();
  }

  @override
  void onInit() async {
    await getUserDataById();
    getAllCategoryes();
    getTeamByBuilderId();
    setEventsType();
    getAllFavoriteEvents();
    super.onInit();
  }

  @override
  showGovernorate() {
    if (shwoGovernorate == true) {
      shwoGovernorate = false;
    } else {
      shwoGovernorate = true;
    }
    update();
  }

  @override
  selecetEventState(String state) {
    eventState = state;
    update();
  }

  @override
  toggleFavoriteEvent(int eventId) async {
    try {
      FavoriteEventsPrams params = FavoriteEventsPrams(
        eventId: eventId,
        userId: userId,
      );
      if (favoriteEventsList.contains(eventId)) {
        removeEventFromFavoriteList(eventId);
        await favoriteEventsData.deleteEventFromFavorite(params);
      } else {
        addEventToFavoriteList(eventId);
        await favoriteEventsData.addEventToFavorite(params);
      }
      update();
    } on PostgrestException catch (e) {
      showCustomSnackBar(e.message.toString());
    }
  }

  @override
  removeEventFromFavoriteList(int id) {
    favoriteEventsList.remove(id);
    update();
  }

  @override
  addEventToFavoriteList(int id) {
    favoriteEventsList.add(id);
    update();
  }
}
