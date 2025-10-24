import 'package:flutter/material.dart';
import 'package:ourcommunity/core/constant/color.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        centerTitle: true,
        title: Text(
          "My Events",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Appcolor.primarycolor,
          ),
        ),
      ),
      backgroundColor: Appcolor.colorbackground,
      body: SafeArea(
        child: Padding(
padding: EdgeInsetsGeometry.symmetric(horizontal: 16,vertical: 5),

        ),
      ),
    );
  }
}
