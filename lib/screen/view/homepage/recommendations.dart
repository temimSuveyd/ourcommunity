import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/recommendations_controller.dart';

import '../../widgets/homepage/recommendations/initialMessageWidget.dart';
import '../../widgets/homepage/recommendations/recommendationCard.dart';


class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecommendationsController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 10.h),

              // 🟢 الهيدر
              Column(
                children: [
                  Text(
                    "اقتراحاتنا لك",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "فعاليات اخترناها بعناية لتناسب اهتماماتك.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.sp,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              // 🟢 المراقبة باستخدام Obx
              Expanded(
                child: Obx(() {
                  if (!controller.hasRecommendations.value) {
                    return InitialMessageWidget(
                      onPressed: () =>
                      controller.hasRecommendations.value = true,
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.events.length,
                      itemBuilder: (context, index) {
                        final event = controller.events[index];
                        return RecommendationCard(
                          event: event,
                          onToggleFavorite: () =>
                              controller.toggleFavorite(event),
                          isFavorite: controller.isFavorite(event),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
