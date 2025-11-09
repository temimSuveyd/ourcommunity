import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/event/my_events_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import 'package:ourcommunity/view/widgets/homepage/event_card.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => MyEventsControllerImp());
    return Scaffold(
      appBar: CustomAppBar('My Events', () => Get.back(),),
      body: SafeArea(
        child: GetBuilder<MyEventsControllerImp>(
          builder: (controller) => Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 5),
            child: HandlingDataView(
                status: controller.statusR,
                child: Expanded(
                    child: ListView.builder(
                  itemCount: controller.eventsList.length,
                  itemBuilder: (context, index) => EventCard(
                    onTap: () {
                      
                    },
                      eventModel:
                          EventModel.fromJson(controller.eventsList[index]),
                      toggleFavorite: () {},
                      isFavorite: true ,
                      showFavoriteButton: false,
                      ),
                ))),
          ),
        ),
      ),
    );
  }
}
