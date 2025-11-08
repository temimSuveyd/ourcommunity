import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ourcommunity/core/class/custom_snacBar.dart';

abstract class NetworkCheckController extends GetxController {
  void initData();
  void updateConnectionStatus(ConnectivityResult result);
}

class NetworkCheckControllerImp extends NetworkCheckController {
  final Connectivity _connectivity = Connectivity();

  @override
  void initData() {
    _connectivity.onConnectivityChanged
        .listen((event) => updateConnectionStatus(event.first));
  }

  @override
  void updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      showCustomSnackBar('No internet connection. Please check your network.');
    } else {
      ScaffoldMessenger.of(Get.context!)..hideCurrentSnackBar();
    }
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
