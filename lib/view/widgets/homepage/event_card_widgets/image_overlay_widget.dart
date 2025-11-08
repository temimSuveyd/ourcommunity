import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class ImageOverlayWidget extends StatelessWidget {
  final double borderRadius;
  final List<Color>? gradientColors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const ImageOverlayWidget({
    super.key,
    this.borderRadius = 20,
    this.gradientColors,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius.r)),
          gradient: LinearGradient(
            begin: begin,
            end: end,
            colors: gradientColors ??
                [
                  Colors.transparent,
                  Appcolor.primarycolor.withOpacity(0.05),
                  Appcolor.primarycolor.withOpacity(0.12),
                ],
          ),
        ),
      ),
    );
  }
}
