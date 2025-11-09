// ✅ تفاصيل إضافية
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/controller/event/event_details_controller.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';

import '../../../../../core/constant/color.dart';

class EventExtraDetails extends StatelessWidget {
  final EventModel eventModel;
  const EventExtraDetails({
    super.key,
    required this.eventModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: Appcolor.primarycolor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(Icons.details,
                  size: 16.sp, color: Appcolor.primarycolor),
            ),
            SizedBox(width: 8.w),
            Text(
              "Additional Details",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Appcolor.primarTextcolor,
                fontFamily: "cairo",
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Column(
          spacing: 12.h,
          children: [
            _buildDetail(
                "Price",
                eventModel.price == 0 ? 'Free' : eventModel.price!.toString(),
                Iconsax.dollar_square,
                Colors.lime),
            _buildDetail("Capacity", eventModel.numberOfPraticipants.toString(),
                Iconsax.people, Colors.blue),
            _buildDetail(
                "Age Group", eventModel.ageGroup!, Iconsax.cake, Colors.green),
            _buildDetail(
                "Gender", eventModel.gender!, Iconsax.man, Colors.pink),
            _buildDetail("Category", eventModel.categoryName!, Iconsax.category,
                Colors.deepPurple),
          ],
        ),
      ],
    );
  }

  Widget _buildDetail(
      String title, String value, IconData icon, Color iconColor) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: iconColor.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: iconColor, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Appcolor.secondTextcolor,
                    fontFamily: "cairo",
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Appcolor.primarTextcolor,
                    fontWeight: FontWeight.w600,
                    fontFamily: "cairo",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventActionButtons extends StatelessWidget {
  const EventActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(Icons.confirmation_number,
                  size: 16.sp, color: Colors.green.shade700),
            ),
            SizedBox(width: 8.w),
            Text(
              "Event Actions",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: "cairo",
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            GetBuilder<EventDetailsControllerImp>(
              builder: (controller) => Expanded(
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: !controller.isJoined
                        ? Appcolor.primarycolor
                        : Appcolor.grey,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      if (!controller.isJoined) {
                        controller.addMemberToEvent();
                      } else {
                        controller.deleteMemberFromEvent();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.confirmation_number,
                            color: Colors.white, size: 18.sp),
                        SizedBox(width: 8.w),
                        Text(
                          !controller.isJoined ? "Join" : "Quit",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "cairo",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            GetBuilder<EventDetailsControllerImp>(
              builder: (controller) => Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.grey.shade300, width: 1.5),
                ),
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () => controller
                      .toggleFavoriteEvent(controller.eventModel!.id!),
                  icon: controller.isEventFavorited
                      ? Icon(Icons.favorite_outline,
                          color: Appcolor.grey, size: 18.sp)
                      : Icon(Icons.favorite,
                          color: Appcolor.primarycolor, size: 18.sp),
                  label: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Appcolor.grey,
                      fontWeight: FontWeight.w600,
                      fontFamily: "cairo",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
