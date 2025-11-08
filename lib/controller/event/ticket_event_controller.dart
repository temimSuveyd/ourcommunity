import 'package:get/get.dart';

class TicketController extends GetxController {
  var ticketCount = 0.obs;
  final double ticketPrice = 0.0; // مجاني
  final int maxTickets = 150;

  void increase() {
    if (ticketCount.value < maxTickets) {
      ticketCount.value++;
    }
  }

  void decrease() {
    if (ticketCount.value > 0) {
      ticketCount.value--;
    }
  }

  double get total => ticketCount.value * ticketPrice;
}
