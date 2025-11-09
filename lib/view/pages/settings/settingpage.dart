import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import 'package:ourcommunity/view/widgets/homepage/profile/setting/theme_button.dart';

import '../../widgets/homepage/profile/setting/accountPrivacySection.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        'Settings',
        () => Get.back(),
      ),
      body: ListView(
        children: [
          SettingSection(),
          // SizedBox(height: 20.h),
          // const NotificationSettingsSection(),
          SizedBox(height: 20.h),
          const AccountPrivacySection(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
