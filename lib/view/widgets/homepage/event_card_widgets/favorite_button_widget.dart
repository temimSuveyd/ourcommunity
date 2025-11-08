import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;
import 'package:ourcommunity/core/constant/color.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isFavorite;
  final double size;

  const FavoriteButtonWidget({
    super.key,
    required this.onTap,
    this.isFavorite = false,
    this.size = 26,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Container(
            height: 44.w,
            width: 44.w,
            decoration: BoxDecoration(
              color: Appcolor.white.withOpacity(0.98),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Appcolor.primarycolor.withOpacity(0.09),
                    blurRadius: 6,
                    offset: const Offset(0, 2)),
              ],
            ),
            child: Align(
              alignment: AlignmentGeometry.center,
              child: Icon(
                isFavorite ? Iconsax.heart5 : Iconsax.heart,
                color: Appcolor.primarycolor,
                size: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
