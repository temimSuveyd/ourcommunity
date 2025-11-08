
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ourcommunity/core/constant/color.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final RxString selectedValue;
  final void Function(String?) onChanged;
  final String? hint;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
  return Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                fontFamily: "cairo",
              ),
            ),
            SizedBox(height: 6.h),
            DropdownButtonFormField<String>(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Appcolor.grey,
                fontSize: 13.sp,
                fontFamily: "cairo",
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Appcolor.grey,
                          fontSize: 14.sp,
                          fontFamily: "cairo",
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Appcolor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  fontFamily: "cairo",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Appcolor.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Appcolor.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      );
  }
}

