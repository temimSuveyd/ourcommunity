import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/homepagecontroller.dart';
import 'package:ourcommunity/core/class/sliver_handlingDataView.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';
import 'package:ourcommunity/screen/widgets/homepage/eventCard.dart';
class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => SliverHandlingDataView(
        status: controller.statusR,
        child: SliverList.builder(
          itemCount: controller.eventsList.length,
          itemBuilder: (context, index) {
            return _animatedEventCard(
              GestureDetector(
                onTap: () {},
                child: EventCard(
                  isFavorite: controller.favoriteEventsList
                      .contains(controller.eventsList[index]["id"]),
                  toggleFavorite: () {
                    final eventId = controller.eventsList[index]["id"];
                    controller.toggleFavoriteEvent(eventId);
                  },
                  eventModel: EventModel.fromJson(controller.eventsList[index]),
                ),
              ),
              index,
            );
          },
        ),
      ),
    );
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
