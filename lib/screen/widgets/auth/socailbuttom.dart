
import 'package:flutter/cupertino.dart';

import '../socialicon.dart';

/// 🔹 Social Buttons Row
class SocialButtons extends StatelessWidget {
  const SocialButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SocialIcon("asset/images/google.png"),
        SizedBox(width: 10),
        SocialIcon("asset/images/apple.png"),
        SizedBox(width: 10),
        SocialIcon("asset/images/facebook.png"),
      ],
    );
  }
}