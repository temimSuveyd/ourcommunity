import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';
import '../../../controller/homepagecontroller.dart';
import '../../widgets/homepage/customBottomNavBar.dart';
import '../../widgets/homepage/filterdrawer.dart';
import '../../widgets/homepage/floatingaddbutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Obx(() => Scaffold(
      backgroundColor: Colors.grey[100],

      // ✅ AppBar مع زر الفلتر
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        centerTitle: true,
        title: Text(
          "local".tr, // ✅ بدل "محلي"
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Appcolor.primarycolor,
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Appcolor.primarycolor,
                size: 22.sp,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),

      // ✅ محتوى الصفحة
      body: controller.pages[controller.currentIndex.value],

      // ✅ زر الإضافة
      floatingActionButton: const FloatingAddButton(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      // ✅ Drawer الفلتر
      endDrawer: FilterDrawer(controller: controller),

      // ✅ شريط التنقل
      bottomNavigationBar: BottomNavBar(controller: controller),
    ));
  }
}
