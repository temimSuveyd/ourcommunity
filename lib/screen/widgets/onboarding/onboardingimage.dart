import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String imagePath;

  const OnboardingImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
