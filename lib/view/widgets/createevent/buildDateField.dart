
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/event/create_event_controller.dart';
import '../../../core/constant/color.dart';

/// DateField مع أيقونة + نص افتراضي "اختر التاريخ"
Widget buildDateField(
    String label,
    CreateEventControllerImp controller,
    bool isStart,
    BuildContext context,
    ) {
  return Obx(() {
    final selectedDate =
    isStart ? controller.selectedStartDate : controller.selectedEndDate;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  fontFamily: "cairo")),
          SizedBox(height: 6.h),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: "${selectedDate.toLocal()}".split(' ')[0],
              hintStyle: TextStyle(
                fontSize: 14.sp,
                fontFamily: "cairo",
                color: Colors.black,
              ),
              suffixIcon: Icon(
                Icons.calendar_today,
                color: Appcolor.primarycolor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Appcolor.grey, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Appcolor.primarycolor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  });
}