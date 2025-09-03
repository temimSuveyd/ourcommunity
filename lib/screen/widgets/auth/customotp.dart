import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SixCardsRow extends StatelessWidget {
  const SixCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // علشان لو الشاشه صغيره يحصل سكرول
      child: Row(
        children: List.generate(6, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              elevation: 8,
              color: Colors.white.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Icon(
                  Icons.lock_outline,
                  size: 40.sp,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
