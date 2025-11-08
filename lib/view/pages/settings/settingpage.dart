import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';

import '../../widgets/homepage/profile/setting/accountPrivacySection.dart';
import '../../widgets/homepage/profile/setting/notificationSettingsSection.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.colorbackground,
      appBar: 
      CustomAppBar('Settings', () => Get.back(),),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NotificationSettingsSection(),
          SizedBox(height: 20.h),
          const AccountPrivacySection(),
        ],
      ),
    );
  }


}




