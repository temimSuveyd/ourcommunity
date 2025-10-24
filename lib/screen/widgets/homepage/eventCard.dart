import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/data/model/event/event_model.dart';
import 'event_card_widgets/event_card_container.dart';
import 'event_card_widgets/event_image_widget.dart';
import 'event_card_widgets/favorite_button_widget.dart';
import 'event_card_widgets/image_overlay_widget.dart';
import 'event_card_widgets/event_title_widget.dart';
import 'event_card_widgets/event_info_chip.dart';
import 'event_card_widgets/divider_widget.dart';
import 'event_card_widgets/event_details_button.dart';

class EventCard extends StatelessWidget {
  final EventModel eventModel;
  final Function() toggleFavorite;
  final bool isFavorite;

  const EventCard({
    super.key,
    required this.eventModel,
    required this.toggleFavorite, 
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return EventCardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Görsel + Favori butonu + overlay
          Stack(
            children: [
              EventImageWidget(
                imageUrl: eventModel.photo,
                height: 155,
                borderRadius: 20,
              ),
              ImageOverlayWidget(
                borderRadius: 20,
              ),
              // Favori butonu sağ üstte
              Positioned(
                top: 13,
                right: 13,
                child: FavoriteButtonWidget(
                  onTap: toggleFavorite,
                  isFavorite: isFavorite,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event title
                EventTitleWidget(
                  title: eventModel.title ?? "Title",
                ),
                SizedBox(height: 8.h),
                // Event info chips
                Wrap(
                  spacing: 8.w,
                  runSpacing: 6.h,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    EventInfoChip(
                      icon: Iconsax.location5,
                      text:
                          "${eventModel.city ?? '-'} / ${eventModel.governorate}",
                    ),
                    EventInfoChip(
                      icon: Iconsax.calendar_15,
                      text: "${eventModel.startDate} - ${eventModel.endDate}",
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                // Divider
                CustomDividerWidget(),

                // Details button
                EventDetailsButton(
                  onTap: () {
                    // detaylara gitmek için
                    // debugPrint("Etkinlik detayına git: ${eventModel.title}");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
