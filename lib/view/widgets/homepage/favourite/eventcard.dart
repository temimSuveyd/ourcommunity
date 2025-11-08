import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../controller/home/favourite_controller.dart';
import '../../../../core/constant/color.dart';
import 'package:get/get.dart';

class EventCard extends StatelessWidget {
  final Map<String, dynamic> event;
  final int index;

  const EventCard({
    super.key,
    required this.event,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final FavoriteEventsController controller = Get.find();

    final imageUrl = event["image"] ?? "";

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      margin: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة الغلاف + أيقونة المفضلة
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: (imageUrl.toString().startsWith("http"))
                    ? Image.network(
                  imageUrl,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/sportimage.jpg",
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                )
                    : Image.asset(
                  imageUrl.isNotEmpty
                      ? imageUrl
                      : "assets/images/sportimage.jpg",
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: GestureDetector(
                  onTap: () {
                    // controller.removeFromFavorite(index);
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.red,
                      size: 28.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // التفاصيل
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event["title"] ?? "بدون عنوان",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "cairo",
                    fontWeight: FontWeight.bold,
                    color: Appcolor.black,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(Icons.calendar_today,
                        size: 16, color: Appcolor.primarycolor),
                    SizedBox(width: 4.w),
                    Text(
                      event["date"] ?? "",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "cairo",
                        color: Appcolor.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16, color: Appcolor.primarycolor),
                    SizedBox(width: 4.w),
                    Text(
                      event["location"] ?? "",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "cairo",
                        color: Appcolor.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
