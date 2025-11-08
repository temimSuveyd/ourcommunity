import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/core/constant/color.dart';

class EventDetailsButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;

  const EventDetailsButton({
    super.key,
    required this.onTap,
    this.text = "Detaylar",
    this.icon = Iconsax.arrow_right_3,
  });

  @override
  State<EventDetailsButton> createState() => _EventDetailsButtonState();
}

class _EventDetailsButtonState extends State<EventDetailsButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _colorAnimation = ColorTween(
      begin: Appcolor.primarycolor,
      end: Appcolor.primarycolor.withOpacity(0.7),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _handleTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Appcolor.primarycolor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Appcolor.primarycolor.withOpacity(0.15),
                  width: 0.8,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                      color: _colorAnimation.value,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      letterSpacing: 0.08,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    widget.icon,
                    color: _colorAnimation.value,
                    size: 18.sp,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
