
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';

/// ✅ ويدجت الصورة الشخصية
class ProfileAvatarPicker extends StatelessWidget {
  const ProfileAvatarPicker({super.key, required this.imageUrl, required this.onPressed});
final String imageUrl ;
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 55.r,
            backgroundImage: NetworkImage(imageUrl),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: CircleAvatar(
              radius: 18.r,
              backgroundColor: Appcolor.primarycolor,
              child: IconButton(onPressed: () =>onPressed() , icon: Icon(Icons.camera_alt, size: 18, color: Colors.white),)
            ),
          ),
        ],
      ),
    );
  }
}
