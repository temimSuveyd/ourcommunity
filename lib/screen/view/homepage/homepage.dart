import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';
import '../../../controller/homepagecontroller.dart';
import '../../widgets/homepage/customBottomNavBar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => HomeControllerImp(),
    );

    return Scaffold(
      backgroundColor: Appcolor.colorbackground,
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Stack(children: [
                controller.pages[controller.currentIndex],
                Builder(
                  builder: (context) {
                    final viewInsets = MediaQuery.of(context).viewInsets.bottom;
                    if (viewInsets > 0) {
                      return const SizedBox.shrink();
                    } else {
                      return BottomNavBar();
                    }
                  },
                ),
              ])),
    );
  }
}
