import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Appimageasset.dart';
import 'package:ourcommunity/core/constant/color.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView(
      {super.key, required this.widget, this.message, required this.status});
  final Widget widget;
  final String? message;
  final Statusreqest status;
  @override
  Widget build(BuildContext context) {
    if (status == Statusreqest.loading) {
      return CustomAnimationImage(
        image: AppImagesasset.loaidngAnimation,
      );
    } else if (status == Statusreqest.faliure) {
      return CustomAnimationImage(
        image: AppImagesasset.worgingAnimation,
        message: message,
      );
    } else {
      return widget;
    }
  }
}

class CustomAnimationImage extends StatelessWidget {
  const CustomAnimationImage({
    super.key,
    this.message,
    required this.image,
  });

  final String? message;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: message != null ? 20 : 0,
        children: [

          SizedBox(height: 200,),
          Center(
            child: LottieBuilder.asset(
              image,
              height: 200,
              width: 200,
            ),
          ),
          message != null
              ? Text(
                  message!,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.black),
                  textAlign: TextAlign.center,
                )
              : Container(),
        ],
      ),
    );
  }
}
