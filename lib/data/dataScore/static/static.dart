import 'package:flutter/material.dart';
import 'package:ourcommunity/core/constant/color.dart';

import '../../model/onboarding_model.dart';

final List<OnboardingModel> onboardinglist = [
  OnboardingModel(
    image: 'asset/images/imagegifone.gif',
    title: "Find Your Community",
    subtitle: "Connect",
    body:
    "Connect with people who share your interests, discover new passions, and feel the power of community.",
    cardsColor: Colors.white, // خلفية الصفحة الأولى
    titleColor: Colors.grey,
    subtitleColor: Colors.black,
    bodyColor: Colors.grey,
    buttonColor: Appcolor.primarycolor,
    controllerColor: Appcolor.primarycolor,
    skipColor: Appcolor.primarycolor,
    textbuttonColor: Appcolor.white
  ),
  OnboardingModel(
    image: 'asset/images/imagegiftwo.gif',
    title: "Stay Updated",
    subtitle: "Discover",
    body:
    "Get the latest news and updates about topics you care about directly in one place.",
    cardsColor: Appcolor.primarycolor, // خلفية فاتحة مختلفة
    titleColor: Colors.white,
    subtitleColor: Colors.white,
    bodyColor: Colors.white,
      buttonColor: Appcolor.white,
      controllerColor: Appcolor.white,
      skipColor:Appcolor.white,
      textbuttonColor: Appcolor.primarycolor
  ),

  OnboardingModel(
    image: 'asset/images/imagegifthree.gif',
    title: "Achieve More",
    subtitle: "Grow",
    body:
    "Expand your knowledge, improve your skills, and grow together with your community.",
    cardsColor: const Color(0xFFFF8F00), // خلفية بلون تاني
    titleColor: Colors.white,
    subtitleColor: Colors.white,
    bodyColor: Colors.white,
    buttonColor: Appcolor.white,
    controllerColor:Colors.white,
    skipColor:Appcolor.white,
      textbuttonColor:  const Color.fromRGBO(255, 143, 0, 1)
  ),
];
