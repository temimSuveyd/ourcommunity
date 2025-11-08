import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';
import '../../../controller/event/ticket_event_controller.dart';
import '../../widgets/homepage/event/ticketbooking/buildHeader.dart';
import '../../widgets/homepage/event/ticketbooking/orderSummary.dart';
import '../../widgets/homepage/event/ticketbooking/payButton.dart';
import '../../widgets/homepage/event/ticketbooking/ticketBox.dart';

class TicketBookingPage extends StatelessWidget {
  const TicketBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TicketController controller = Get.put(TicketController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "حجز التذاكر",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Appcolor.black,
            fontFamily: "cairo",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Appcolor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeader(),
                  const SizedBox(height: 20),
                  TicketBox(controller: controller),
                  const SizedBox(height: 24),
                  const Divider(thickness: 1.2),
                  const OrderSummary(),
                  const SizedBox(height: 24),
                  PayButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



