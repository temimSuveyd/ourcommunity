import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/screen/widgets/homepage/favourite/eventcard.dart';
import '../../../../controller/favouritecontroller.dart';
import '../../../../core/constant/color.dart';


class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.put(FavoriteController());

    return Column(
      children: [
        // ✅ العنوان
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Center(
            child: Text(
              "الفعاليات المحفوظة",
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "cairo",
                color: Appcolor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // ✅ القائمة
        Expanded(
          child: Obx(() {
            if (controller.favoriteEvents.isEmpty) {
              return Center(
                child: Text(
                  "لا توجد فعاليات محفوظة",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "cairo",
                    color: Appcolor.grey,
                  ),
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.all(12.w),
              itemCount: controller.favoriteEvents.length,
              itemBuilder: (context, index) {
                return EventCard(
                  event: controller.favoriteEvents[index],
                  index: index,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
