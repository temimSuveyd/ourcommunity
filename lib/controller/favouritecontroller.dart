import 'package:get/get.dart';

class FavoriteController extends GetxController {
  // الليست الأساسية
  final RxList<Map<String, dynamic>> favorites = <Map<String, dynamic>>[].obs;

  // علشان الكود القديم اللي بيستخدم favoriteEvents يشتغل بدون تعديل
  RxList<Map<String, dynamic>> get favoriteEvents => favorites;

  /// اضف للمفضلة (لو مش مكرر)
  void addToFavorite(Map<String, dynamic> event) {
    if (!isFavorite(event)) {
      favorites.add(event);
    }
  }

  /// شيل عنصر بالمؤشر (للاستخدام في صفحة المفضلة)
  void removeFromFavorite(int index) {
    if (index >= 0 && index < favorites.length) {
      favorites.removeAt(index);
    }
  }

  /// شيل عنصر بالحدث نفسه (اختياري)
  void removeByEvent(Map<String, dynamic> event) {
    final idx = _indexOf(event);
    if (idx != -1) favorites.removeAt(idx);
  }

  /// اقلب حالة المفضلة (يضيف/يحذف)
  void toggleFavorite(Map<String, dynamic> event) {
    final idx = _indexOf(event);
    if (idx != -1) {
      favorites.removeAt(idx);
    } else {
      favorites.add(event);
    }
  }

  /// امسح الكل
  void clearFavorites() {
    favorites.clear();
  }

  /// هل الحدث محفوظ؟
  bool isFavorite(Map<String, dynamic> event) => _indexOf(event) != -1;

  /// مقارنة ذكية (يفضل يكون فيه id للحدث)
  int _indexOf(Map<String, dynamic> event) {
    if (event['id'] != null) {
      return favorites.indexWhere((e) => e['id'] == event['id']);
    }
    // بديل لو مفيش id: نقارن بعنوان + تاريخ لتقليل التكرار
    return favorites.indexWhere((e) =>
    e['title'] == event['title'] && e['date'] == event['date']);
  }
}
