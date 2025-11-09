import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/home/favourite_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';
import 'package:ourcommunity/view/widgets/homepage/event_card.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => FavoriteEventsControllerImp(),
    );
    return GetBuilder<FavoriteEventsControllerImp>(
      builder: (controller) => HandlingDataView(
        status: controller.statusR,
        message: "No saved Events found.",
        child: Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(12.w),
            itemCount: controller.eventsList.length,
            itemBuilder: (context, index) {
              return _animatedEventCard(
                GestureDetector(
                  onTap: () {},
                  child: EventCard(
                    onTap: () {
                      
                    },
                    isFavorite: controller.favoritesIdsList
                        .contains(controller.eventsList[index]["id"]),
                    toggleFavorite: () {
                      final eventId = controller.eventsList[index]["id"];
                      controller.toggleFavoriteEvent(eventId);
                    },
                    eventModel:
                        EventModel.fromJson(controller.eventsList[index]),
                  ),
                ),
                index,
              );
            },
          ),
        ),
      ),
    );
  }
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
