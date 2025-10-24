import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ourcommunity/core/class/handling_data.dart';
import 'package:ourcommunity/core/constant/Appimageasset.dart';
import 'package:ourcommunity/core/constant/color.dart';

class SliverHandlingDataView extends StatelessWidget {
  const SliverHandlingDataView(
      {super.key, required this.child, this.message, required this.status});
  final Widget child;
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
    } else if (status == Statusreqest.noData) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
          child: Column(
            children: [
              Icon(
                Icons.inbox,
                size: 100,
                color: Appcolor.primarycolor.withOpacity(0.25),
              ),
              const SizedBox(height: 24),
              Text(
                message ?? "No data",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    } else {
      return child;
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
    return SliverToBoxAdapter(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: message != null ? 20 : 0,
          children: [
            SizedBox(
              height: 200,
            ),
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
      ),
    );
  }
}
