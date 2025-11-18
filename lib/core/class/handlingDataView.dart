import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Appimageasset.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView(
      {super.key, required this.child, this.message, required this.status});
  final Widget child;
  final String? message;
  final Statusreqest status;
  @override
  Widget build(BuildContext context) {
    if (status == Statusreqest.loading) {
      return Expanded(
        child: Center(
          child: LoadingAnimationWidget.dotsTriangle(
              color: Appcolor.primarycolor, size: 80),
        ),
      );
    } else if (status == Statusreqest.faliure) {
      return CustomAnimationImage(icon: Iconsax.info_circle);
    } else if (status == Statusreqest.noData) {
      return CustomAnimationImage(icon: Iconsax.archive_minus);
    } else {
      return child;
    }
  }
}

class CustomAnimationImage extends StatelessWidget {
  const CustomAnimationImage({
    super.key,
    this.message,
    required this.icon,
  });

  final String? message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: message != null ? 20 : 0,
        children: [
          SizedBox(
            height: 200,
          ),
          Center(
              child: Icon(
            icon,
            size: 80,
            color: Appcolor.primarycolor,
          )),
          message != null
              ? Text(
                  message!,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.primarycolor),
                  textAlign: TextAlign.center,
                )
              : Container(),
        ],
      ),
    );
  }
}
