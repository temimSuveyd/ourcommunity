
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';

/// ✅ ويدجت الصورة الشخصية
class ProfileAvatarPicker extends StatelessWidget {
  const ProfileAvatarPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 55.r,
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: Appcolor.primarycolor,
              child: Icon(Icons.camera_alt, size: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
