import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/core/constant/color.dart';

class NavigationBarAddButton extends StatelessWidget {
  const NavigationBarAddButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Appcolor.primarycolor,
          borderRadius: BorderRadius.circular(15)
          // border: Border.all(color: Colors.white, width: 3),
          ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Icon(
              Iconsax.add,
              color: Appcolor.white,
              size: 34,
            ),
          ),
        ),
      ),
    );
  }
}
