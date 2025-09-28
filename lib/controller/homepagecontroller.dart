import 'package:get/get.dart';
import 'package:flutter/material.dart';


class HomeController extends GetxController {
  // ✅ الفهرس الحالي
  var currentIndex = 0.obs;

  // ✅ الصفحات
  final List<Widget> pages = [
    // const HomePageBody(),
    // const FavoritePage(),
    // const RecommendationsPage(),
    // const ProfilePage(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }

  // ✅ القيم المترجمة (فلترة + أحداث)
  var selectedGovernorate = "all_governorates".obs;
  var selectedCategory = "all_categories".obs;

  // ✅ بيانات الأحداث (ممكن لاحقًا نترجمها أيضًا)
  var events = [
    {
      "title": "بطولة كرة قدم شبابية",
      "date": "الثلاثاء, 20 أغسطس",
      "location": "الفحيحيل, الأحمدي",
      "ageGroup": "18-25",
      "gender": "ذكور",
      "wheelchair": "نعم",
      "capacity": "200 شخص",
      "image": "https://picsum.photos/600/300?random=1",
      "organizer": "وزارة الشباب"
    },
    {
      "title": "مهرجان موسيقي",
      "date": "الجمعة, 5 سبتمبر",
      "location": "السالمية, حولي",
      "ageGroup": "الكل",
      "gender": "الكل",
      "wheelchair": "لا",
      "capacity": "500 شخص",
      "image": "https://picsum.photos/600/300?random=2",
      "organizer": "الهيئة العامة للثقافة"
    },
  ].obs;

  // ✅ الفلاتر
  var price = "all_prices".obs;
  var ageGroup = "all_age_groups".obs;
  var gender = "all_genders".obs;

  // ✅ الخيارات كمفاتيح للترجمة
  final priceOptions = ["all_prices", "free", "paid"];
  final ageOptions = ["all_age_groups", "kids", "teens", "adults"];
  final genderOptions = ["all_genders", "male", "female"];

  void resetFilters() {
    price.value = "all_prices";
    ageGroup.value = "all_age_groups";
    gender.value = "all_genders";
  }
}
