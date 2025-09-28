import 'package:get/get.dart';

class RecommendationsController extends GetxController {
  var hasRecommendations = false.obs;
  var favorites = <Map<String, String>>[].obs;

  // بيانات افتراضية للفعاليات
  final events = [
    {
      "title": "مهرجان الموسيقى",
      "date": "10 سبتمبر 2025",
      "location": "القاهرة - مصر",
      "image": "https://picsum.photos/600/400?1",
    },
    {
      "title": "معرض الكتاب",
      "date": "15 أكتوبر 2025",
      "location": "الإسكندرية - مصر",
      "image": "https://picsum.photos/600/400?2",
    },
    {
      "title": "سباق الجري",
      "date": "20 نوفمبر 2025",
      "location": "أسوان - مصر",
      "image": "https://picsum.photos/600/400?3",
    },
  ];

  // إضافة/إزالة من المفضلة
  void toggleFavorite(Map<String, String> event) {
    if (isFavorite(event)) {
      favorites.remove(event);
    } else {
      favorites.add(event);
    }
  }

  // تحقق إذا الفعالية مفضلة
  bool isFavorite(Map<String, String> event) {
    return favorites.contains(event);
  }
}
