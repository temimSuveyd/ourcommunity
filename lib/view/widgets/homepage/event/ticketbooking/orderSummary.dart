
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../controller/event/ticket_event_controller.dart';
import '../../../../../core/constant/color.dart';

/// ✅ ملخص الطلب
class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final TicketController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text("Order Summary",
              style: TextStyle(
                  color: Appcolor.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "cairo")),
        ),
        const SizedBox(height: 12),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Number of Tickets",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    fontFamily: "cairo")),
            Text("${controller.ticketCount.value}",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "cairo")),
          ],
        )),
        SizedBox(height: 8.h),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Amount",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontFamily: "cairo")),
            Text("${controller.total.toStringAsFixed(3)} د.ك",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.primarycolor,
                    fontFamily: "cairo")),
          ],
        )),
      ],
    );
  }
}