// ✅ صورة الفعالية + زر الرجوع + الكارد
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';

class EventImageHeader extends StatelessWidget {
  final EventModel eventModel;
  const EventImageHeader({super.key, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.r),
            bottomRight: Radius.circular(25.r),
          ),
          child: Image.network(
            eventModel.photo!,
            width: double.infinity,
            height: 280.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "assets/images/default_event.png",
                width: double.infinity,
                height: 280.h,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Positioned(
          top: 40.h,
          left: 16.w,
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.6),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        Positioned(
          bottom: -70.h,
          left: 16.w,
          right: 16.w,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.grey.shade100, width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventModel.title ?? "No Title",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "cairo",
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.grey.shade200, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 18.r,
                          backgroundImage: NetworkImage(
                            eventModel.userPhoto ??
                                "https://via.placeholder.com/150",
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventModel.teamName ?? "no data",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                                fontFamily: "cairo",
                              ),
                            ),
                            Text(
                              eventModel.userName ?? "Unknown Organizer",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                fontFamily: "cairo",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
