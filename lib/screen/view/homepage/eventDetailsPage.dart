import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/core/constant/Approutes.dart';
import 'package:ourcommunity/core/constant/color.dart';

import '../../widgets/homepage/event/eventdetails/eventDescription.dart';
import '../../widgets/homepage/event/eventdetails/eventExtraDetails.dart';
import '../../widgets/homepage/event/eventdetails/eventFooterActions.dart';
import '../../widgets/homepage/event/eventdetails/eventImageHeader.dart';
import '../../widgets/homepage/event/eventdetails/eventInfoRow.dart';

class EventDetailsPage extends StatelessWidget {
  const EventDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> event =
        (Get.arguments as Map<String, dynamic>?) ?? {};

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EventImageHeader(event: event),
            SizedBox(height: 80.h),
            EventInfoRow(event: event),
            SizedBox(height: 20.h),
            EventDescription(event: event),
            SizedBox(height: 20.h),
            EventExtraDetails(event: event),
            SizedBox(height: 20.h),
            EventActionButtons(),
            SizedBox(height: 16.h),
            EventFooterActions(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}


//

//



