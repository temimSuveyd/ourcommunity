import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/favouritecontroller.dart';
import '../../../controller/homepagecontroller.dart';
import '../../../core/constant/color.dart';
import '../../widgets/homepage/eventlist.dart';
import '../../widgets/homepage/filterchips.dart';
import '../../widgets/homepage/searchfield.dart';


class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    Get.put(FavoriteController());

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),

          /// مربع البحث
          const SearchField(),

          SizedBox(height: 20.h),

          /// الفلاتر
          FilterChips(controller: controller),

          SizedBox(height: 20.h),

          /// العنوان + عرض الكل
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "available_events".tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "view_all".tr,
                  style: TextStyle(
                    color: Appcolor.primarycolor,
                    fontFamily: "cairo",
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 15.h),

          /// قائمة الفعاليات
          const EventList(),
        ],
      ),
    );
  }
}
