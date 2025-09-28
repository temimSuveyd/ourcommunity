import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/homepagecontroller.dart';
import '../../../screen/widgets/homepage/eventCard.dart';

import '../../view/homepage/eventDetailsPage.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Obx(() => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.events.length,
      itemBuilder: (context, index) {
        final event = controller.events[index];

        return Column(
          children: [
            _animatedEventCard(
              GestureDetector(
                onTap: () {
                  Get.to(
                        () => const EventDetailsPage(),
                    arguments: event,
                  );
                },
                child: EventCard(
                  title: event['title'] ?? "بدون عنوان",
                  date: event['date'] ?? "",
                  location: event['location'] ?? "",
                  image: event['image'] ?? "",
                ),
              ),
              index,
            ),
            SizedBox(height: 15.h),
          ],
        );
      },
    ));
  }

  Widget _animatedEventCard(Widget card, int index) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 600 + (index * 200)),
      curve: Curves.easeOut,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },
      child: card,
    );
  }
}
