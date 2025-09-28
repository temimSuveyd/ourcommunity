import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constant/Approutes.dart';
import '../../../core/constant/color.dart';
import '../../widgets/homepage/profile/logoutButton.dart';
import '../../widgets/homepage/profile/profileHeader.dart';
import '../../widgets/homepage/profile/profileOptionTile.dart';
import '../../widgets/homepage/profile/teamSection.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Appcolor.white,

      body: Column(
        children: [
          Text(
            "حسابي",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "cairo",
              fontWeight: FontWeight.bold,
            ),
          ),
          // 🔹 الهيدر
          const ProfileHeader(
            name: "شيماء عمارة",
            email: "shymaa@example.com",
            image: "asset/images/avatar.png",
          ),

          // 🔹 القائمة
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Appcolor.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Appcolor.grey.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ProfileOptionTile(
                        icon: Icons.edit,
                        title: "تعديل الملف الشخصي",
                        onTap: () => Get.toNamed(Approutes.editProfilePage),
                      ),
                      Divider(height: 1, color: Appcolor.grey.withOpacity(0.3)),
                      ProfileOptionTile(
                        icon: Icons.verified_user,
                        title: "توثيق الهوية",
                        onTap: () => Get.toNamed(Approutes.verifyIdentityPage),
                      ),
                      Divider(height: 1, color: Appcolor.grey.withOpacity(0.3)),
                      ProfileOptionTile(
                        icon: Icons.settings,
                        title: "الإعدادات",
                        onTap: () => Get.toNamed(Approutes.settingsPage),
                      ),
                    ],
                  ),
                ),

                // 🔹 قسم الفرق
                TeamSection(
                  onCreateTeam: () => Get.toNamed(Approutes.createTeamPage),
                  teams: [
                    {
                      "image": "assets/images/team1.png",
                      "title": "فريق الدمسه",
                      "subtitle": "واجهة المستخدم",
                      "onTap": () => Get.toNamed(Approutes.quraaAldasmaPage),
                    },
                    {
                      "image": "assets/images/team2.png",
                      "title": "فريق البرمجة",
                      "subtitle": "تطوير التطبيقات",
                      "onTap": () {},
                    },
                    {
                      "image": "assets/images/team3.png",
                      "title": "فريق التسويق",
                      "subtitle": "حملات إعلانية",
                      "onTap": () {},
                    },
                  ],
                ),

                // 🔹 زر تسجيل الخروج
                LogoutButton(
                  onLogout: () {
                    // TODO: تنفيذ تسجيل الخروج
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
