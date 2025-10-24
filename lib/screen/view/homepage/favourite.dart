import 'package:flutter/material.dart';
import 'package:ourcommunity/core/constant/color.dart';

import '../../widgets/homepage/favourite/favouritebody.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        centerTitle: true,
        title: Text(
          "Saved Events",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Appcolor.primarycolor,
          ),
        ),
      ),
      backgroundColor: Appcolor.colorbackground,
      body: SafeArea(
        child: FavoriteBody(),
      ),
    );
  }
}
