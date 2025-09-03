
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 🔹 Single Social Icon
class SocialIcon extends StatelessWidget {
  final String path;
  const SocialIcon(this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding:EdgeInsets.all(10),
      decoration:  BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Image.asset(path, fit: BoxFit.contain),
    );
  }
}
