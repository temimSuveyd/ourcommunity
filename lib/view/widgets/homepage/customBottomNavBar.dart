// ✅ Şerit alt gezinme barı tamamen sıfırdan, hatasız şekilde yazıldı
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/controller/home/home_page_controller.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/data/dataScore/static/home/navigation_bar_data.dart';
import 'package:ourcommunity/view/widgets/homepage/navigation_bar_add_button.dart';
import '../../../core/constant/color.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Positioned(
        bottom: 12,
        left: 16,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Appcolor.colorbackground,
              boxShadow: [
                BoxShadow(
                    color: Appcolor.grey, blurRadius: 10, offset: Offset(0, 10))
              ]),
          height: 60,
          width: Get.width - 32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(
                navigationBarIcons.length,
                (index) {
                  if (index != 2) {
                    return IconButton(
                        onPressed: () {
                          controller.changePage(index);
                        },
                        icon: Icon(
                          navigationBarIcons[index],
                          color: controller.currentIndex == index
                              ? Appcolor.primarycolor
                              : Colors.grey.shade600,
                          size: 27,
                        ));
                  } else {
                    return NavigationBarAddButton(
                      onTap: () {
                        Get.toNamed(AppRoutes.createEventPage);
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
