import 'dart:ui';
import 'package:flutter/material.dart';

class OnboardingModel {
  final String? title;
  final String? subtitle;
  final String? image;
  final String? body;
  final Color? backgroundColor; // لون الخلفية المخصص
  final Color? titleColor;      // لون العنوان
  final Color? subtitleColor;   // لون العنوان الفرعي
  final Color? bodyColor;       // لون النص الأساسي
  final Color? buttonColor;       // لون زرار Next
  final Color? controllerColor;   // لون الـ Page Indicator
  final Color? skipColor;
  final Color? textbuttonColor;
  OnboardingModel({
    this.title,
    this.subtitle,
    this.image,
    this.body,
    this.backgroundColor,
    this.titleColor,
    this.subtitleColor,
    this.bodyColor,
    this.buttonColor,
    this.controllerColor,
    this.skipColor,
    this.textbuttonColor


  });
}
