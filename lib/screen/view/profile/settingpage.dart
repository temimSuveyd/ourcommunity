import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

import '../../widgets/homepage/profile/setting/accountPrivacySection.dart';
import '../../widgets/homepage/profile/setting/notificationSettingsSection.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.white,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NotificationSettingsSection(),
            SizedBox(height: 20.h),
            const AccountPrivacySection(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Appcolor.white,
      title: Text(
        "الإعدادات",
        style: TextStyle(
          fontSize: 18.sp,
          color: Appcolor.black,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo",
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.5),
        child: Container(
          color: Colors.grey.shade200,
          height: 1.5,
        ),
      ),
    );
  }
}




