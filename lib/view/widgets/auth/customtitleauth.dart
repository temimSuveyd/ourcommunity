import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class Customtitleauth extends StatelessWidget {
  final String title;

  const Customtitleauth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return
       Center(
        child: Text(
          title
         ,
          style: TextStyle(
            fontSize: 30.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
          ),
        ),

    );
  }
}
