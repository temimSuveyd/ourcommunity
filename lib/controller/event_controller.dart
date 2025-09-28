import 'package:get/get.dart';

class EventController extends GetxController {
  var events = [].obs;

  var favorites = <int>[].obs;

  void toggleFavorite(int index) {
    if (favorites.contains(index)) {
      favorites.remove(index);
    } else {
      favorites.add(index);
    }
  }

  bool isFavorite(int index) => favorites.contains(index);
}
