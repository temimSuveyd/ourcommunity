
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';

/// 🔹 Notification Section - Modern & Aesthetic Design (Stateless)
class NotificationSettingsSection extends StatelessWidget {
  const NotificationSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Appcolor.cardColor,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 10,
            spreadRadius: -2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title with accent bar
          Row(
            children: [
              Container(
                width: 5.w,
                height: 23.h,
                decoration: BoxDecoration(
                  color: Appcolor.primarycolor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Appcolor.primarycolor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "cairo",
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Switch tiles in a card with modern feel
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
            elevation: 0,
            margin: EdgeInsets.zero,
            color: Appcolor.cardColor,
            child: Column(
              children: [
                _CustomNotificationSwitchTile(
                  icon: Icons.place_rounded,
                  iconColor: Colors.indigo.shade400,
                  title: "Area events",
                  subtitle: "Nearby event alert",
                  value: true,
                  onChanged: (_) {},
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 17.w,
                  endIndent: 17.w,
                  color: Colors.grey.shade200,
                ),
                _CustomNotificationSwitchTile(
                  icon: Icons.star_rate_rounded,
                  iconColor: Colors.orange.shade400,
                  title: "Suggestions",
                  subtitle: "Interest-based tips",
                  value: true,
                  onChanged: (_) {},
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  indent: 17.w,
                  endIndent: 17.w,
                  color: Colors.grey.shade200,
                ),
                _CustomNotificationSwitchTile(
                  icon: Icons.groups_rounded,
                  iconColor: Colors.teal.shade700,
                  title: "Team alerts",
                  subtitle: "Team activity alerts",
                  value: false,
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomNotificationSwitchTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _CustomNotificationSwitchTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 38.w,
        height: 38.w,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15.5.sp,
          color: Appcolor.primarTextcolor,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo",
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12.5.sp,
            color: Appcolor.secondTextcolor,
            fontFamily: "cairo",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: Appcolor.primarycolor,
        inactiveThumbColor: Colors.grey.shade300,
        inactiveTrackColor: Colors.grey.shade200,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 4.h),
      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
      ),
      minVerticalPadding: 0,
    );
  }
}
