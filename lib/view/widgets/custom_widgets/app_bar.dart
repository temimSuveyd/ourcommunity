import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

AppBar CustomAppBar(String title, Function() onPressed,
    {bool showLeading = true}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        color: Appcolor.primarycolor,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
    ),
    centerTitle: true,
    backgroundColor: Appcolor.backgroundColor,
    elevation: 0,
    leading: showLeading
        ? IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Appcolor.primarycolor),
            onPressed: onPressed)
        : SizedBox(),
    automaticallyImplyLeading: false,
  );
}
