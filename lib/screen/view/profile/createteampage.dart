import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';
import '../../widgets/homepage/profile/createteam/teamFormContainer.dart';


class CreateTeamPage extends StatelessWidget {
  const CreateTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolor.white,
        title: Text(
          "إنشاء فريق جديد",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
            color: Appcolor.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.5,
          ),
        ),
      ),
      body: const TeamFormContainer(), // ✅ استدعاء الودجت المنفصل
    );
  }
}
