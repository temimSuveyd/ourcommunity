
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../controller/event/ticket_event_controller.dart';
import '../../../../../core/constant/color.dart';

/// ✅ صندوق اختيار التذاكر
class TicketBox extends StatelessWidget {
  final TicketController controller;
  const TicketBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Free",
              style: TextStyle(
                  fontSize: 16,
                  color: Appcolor.primarycolor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "cairo")),
          SizedBox(height: 4.h),
          Text("Per person / Available up to 150 tickets",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.grey2,
                  fontFamily: "cairo")),
          const SizedBox(height: 14),
         Row(
            children: [
              _circleButton(Icons.remove, Colors.grey.shade200,
                  Colors.black, controller.decrease),
              const SizedBox(width: 16),
              Text("${controller.ticketCount.value}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "cairo")),
              const SizedBox(width: 16),
              _circleButton(Icons.add, Colors.blue, Colors.white,
                  controller.increase),
            ],
          )
        ],
      ),
    );
  }
  Widget _circleButton(
      IconData icon, Color bg, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: bg,
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
