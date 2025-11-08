import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.dataList,
    required this.onChanged,
    required this.hintText,
    this.onTap, this.height, 
  });
  final List<String> dataList;
  final Function(String) onChanged;
  final String hintText;
  final Function()? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Appcolor.grey.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: DropdownButtonFormField<String>(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        dropdownColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Appcolor.grey,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            fontFamily: "cairo",
          ),
          filled: true,
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: Appcolor.primarycolor,
              width: 1.5,
            ),
          ),
        ),
        style: TextStyle(
          fontSize: 14.sp,
          color: Appcolor.black,
          fontFamily: "cairo",
          fontWeight: FontWeight.w500,
        ),
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          color: Appcolor.primarycolor,
          size: 20.sp,
        ),
        items: dataList
            .toSet()
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "cairo",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
      ),
    );
  }
}
