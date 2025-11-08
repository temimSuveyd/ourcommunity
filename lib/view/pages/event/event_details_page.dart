import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/event/event_details_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/data/model/user_model.dart';
import 'package:ourcommunity/view/widgets/all_users/all_users_card.dart';
import '../../widgets/homepage/event/eventdetails/eventDescription.dart';
import '../../widgets/homepage/event/eventdetails/event_extra_details.dart';
import '../../widgets/homepage/event/eventdetails/eventImageHeader.dart';
import '../../widgets/homepage/event/eventdetails/eventInfoRow.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EventDetailsControllerImp());
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: GetBuilder<EventDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          status: controller.statusR,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: EventImageHeader(
                  eventModel: controller.eventModel!,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 90.h)),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.grey.shade100, width: 1),
                  ),
                  child: EventInfoRow(
                    eventModel: controller.eventModel!,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.grey.shade100, width: 1),
                  ),
                  child: EventDescription(
                    eventModel: controller.eventModel!,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.grey.shade100, width: 1),
                  ),
                  child: EventExtraDetails(
                    eventModel: controller.eventModel!,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              GetBuilder<EventDetailsControllerImp>(
                builder: (controller) {
                  if (controller.isBuilder!) {
                    return EventMemebersListView();
                  } else {
                    return SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border:
                              Border.all(color: Colors.grey.shade100, width: 1),
                        ),
                        child: EventActionButtons(),
                      ),
                    );
                  }
                },
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            ],
          ),
        ),
      ),
    );
  }
}

class EventMemebersListView extends StatelessWidget {
  const EventMemebersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailsControllerImp>(
      builder: (controller) => SliverList.builder(
          itemCount: controller.membersList.length,
          itemBuilder: (context, index) => AllUsersCard(
              userModel: UserModel.fromMap(
                  controller.membersList[index], 'profile_data'),
              onPressed: () {},
              isOnTeam: true)),
    );
  }
}


//

//



