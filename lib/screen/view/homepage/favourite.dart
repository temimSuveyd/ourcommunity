import 'package:flutter/material.dart';

import '../../widgets/homepage/favourite/favouritebody.dart';


class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     // backgroundColor: Colors.white,
      body: SafeArea(
        child: FavoriteBody(),
      ),
    );
  }
}
