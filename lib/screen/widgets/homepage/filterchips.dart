import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/data/dataScore/static/auth/citys_data.dart';
import 'package:ourcommunity/screen/widgets/auth/dropdownButton.dart';
import '../../../controller/homepagecontroller.dart';

class FilterChips extends StatelessWidget {
  final HomeControllerImp controller;
  const FilterChips({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: Get.width / 2 - 30,
          height: 50,
          child: CustomDropdownButton(
              dataList: cities, onChanged: (value) {}, hintText: "set a city"),
        ),
        SizedBox(
          width: Get.width / 2 - 30,
          height: 50,
          child: CustomDropdownButton(
              dataList: cities, onChanged: (value) {}, hintText: "set a city"),
        ),
      ],
    );
  }
}
