import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomNavItem(icon: Iconsax.user, label: "حسابي"),
          _BottomNavItem(icon: Iconsax.heart, label: "المحفوظة"),
          const SizedBox(width: 40), // مكان زر +
          _BottomNavItem(icon: Iconsax.star, label: "توصيات"),
          _BottomNavItem(icon: Iconsax.home, label: "الرئيسية", isActive: true),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _BottomNavItem({required this.icon, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: isActive ? Colors.blue : Colors.grey),
        Text(label, style: TextStyle(color: isActive ? Colors.blue : Colors.grey)),
      ],
    );
  }
}
