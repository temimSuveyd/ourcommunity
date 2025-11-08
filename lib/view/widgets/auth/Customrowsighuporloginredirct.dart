import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../core/constant/color.dart';

class Customrowsighuporloginredirct extends StatelessWidget {
  final String textone;
  final String texttwo;
  final        void Function()? ontap;
  const Customrowsighuporloginredirct({super.key, required this.textone, required this.texttwo, this.ontap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
            fontSize: 15.sp,
          ),
        ),
        SizedBox(width: 10.w),
        InkWell(
          onTap: ontap,
          child: Text(
            texttwo,
            style: TextStyle(
              color: Appcolor.black, // لون مختلف علشان يبان clickable
              fontWeight: FontWeight.bold,
              fontFamily: "cairo",
              fontSize: 17.sp,
              decoration: TextDecoration.underline, // خط تحت النص لو حابب
            ),
          ),
        ),
      ],
    );
  }
}
