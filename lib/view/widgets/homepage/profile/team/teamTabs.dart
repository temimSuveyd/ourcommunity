import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/team/team_view_controller.dart';
import '../../../../../core/constant/color.dart';

class TeamTabs extends StatelessWidget {
  const TeamTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'title': 'Members'},
      {'title': 'Settings'},
    ];

    return GetBuilder<TeamViewControllerImp>(
      builder: (controller) => Container(
        padding: EdgeInsets.all(6.w),
        decoration: BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.14),
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = controller.selectedTap == index;
            return Expanded(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 180),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                decoration: BoxDecoration(
                  color: isSelected ? Appcolor.primarycolor : Appcolor.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: isSelected
                      ? Border.all(color: Appcolor.primarycolor, width: 2)
                      : Border.all(color: Colors.grey.shade300),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Appcolor.primarycolor.withOpacity(0.15),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : [],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () => controller.selectTap(index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Center(
                        child: Text(
                          tabs[index]['title']!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Appcolor.white
                                : Appcolor.primarycolor,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
