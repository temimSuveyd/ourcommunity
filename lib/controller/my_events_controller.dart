import 'package:get/get.dart';
import 'package:ourcommunity/data/dataScore/remote/my_events_data.dart';

abstract class MyEventsController extends GetxController {
void getMyEvents();
}


class MyEventsControllerImp extends MyEventsController {

  MyEventsData myEventsData = MyEventsData();
  

  @override
  void getMyEvents() {

  }
  
}