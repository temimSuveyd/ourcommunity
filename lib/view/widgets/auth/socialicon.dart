import 'package:flutter/material.dart';

/// 🔹 Social Icon Button - Just shows an icon (no click action)
class SocialIcon extends StatelessWidget {
  final String path;

  const SocialIcon(
    this.path, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15)));
  }
}
