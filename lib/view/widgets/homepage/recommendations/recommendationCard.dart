import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/color.dart';

class RecommendationCard extends StatelessWidget {
  final Map<String, dynamic> event;
  final VoidCallback onToggleFavorite;
  final bool isFavorite;

  const RecommendationCard({
    super.key,
    required this.event,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appcolor.cardColor,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ الصورة + القلب
          Stack(
            children: [
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
                  image: event["image"] != null
                      ? DecorationImage(
                    image: NetworkImage(event["image"]!),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: event["image"] == null
                    ? const Center(
                  child: Text(
                    "600 × 400",
                    style: TextStyle(fontSize: 22, color: Colors.grey),
                  ),
                )
                    : null,
              ),
              Positioned(
                top: 8,
                left: 8,
                child: IconButton(
                  onPressed: onToggleFavorite,
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                  ),
                ),
              ),
            ],
          ),

          // ✅ تفاصيل الفعالية
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event["title"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    fontFamily: "cairo",
                    color: Appcolor.primarTextcolor,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.calendar_today,
                        size: 16.sp, color: Appcolor.primarycolor),
                    const SizedBox(width: 6),
                    Text(
                      event["date"]!,
                      style: TextStyle(
                        fontFamily: "cairo",
                        color: Appcolor.secondTextcolor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 16.sp, color: Appcolor.primarycolor),
                    const SizedBox(width: 6),
                    Text(
                      event["location"]!,
                      style: TextStyle(
                        color: Appcolor.secondTextcolor,
                        fontSize: 16.sp,
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
