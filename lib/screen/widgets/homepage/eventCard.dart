import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/core/constant/color.dart';


import '../../../controller/favouritecontroller.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String? image; // ✅ ممكن تكون null

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final FavoriteController favController = Get.find();

    final Map<String, dynamic> event = {
      "title": title,
      "date": date,
      "location": location,
      "image": image,
    };

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// صورة الفعالية + أيقونة المفضلة
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: image != null && image!.isNotEmpty
                    ? Image.network(
                  image!,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/placeholder.png",
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                )
                    : Image.asset(
                  "assets/images/placeholder.png",
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              /// زر المفضلة أعلى اليمين
              Positioned(
                top: 10,
               left: 10,
                child: Obx(() {
                  final isFav = favController.isFavorite(event);
                  return InkWell(
                    onTap: () => favController.toggleFavorite(event),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(
                        isFav ? Icons.favorite_border_outlined :Icons.favorite_border_outlined ,
                        color: isFav ? Colors.red : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),

          /// تفاصيل الفعالية
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Appcolor.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "cairo",
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Iconsax.calendar_15,
                        size: 16.sp, color: Appcolor.primarycolor),
                    const SizedBox(width: 5),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontFamily: "cairo",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Iconsax.location5, size: 16.sp, color: Colors.red),
                    const SizedBox(width: 5),
                    Text(
                      location,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 14.sp,
                        fontFamily: "cairo",
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
