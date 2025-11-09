import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';

import '../../widgets/homepage/favourite/favourite_body.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Saved Events', () => Get.back(),showLeading: false,),
      backgroundColor: Appcolor.backgroundColor,
      body: SafeArea(
        child: FavoriteBody(),
      ),
    );
  }
}
