import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nlk/constants/app_constants.dart';

// toast functions
void toast(BuildContext context, String title) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppConfig.colors.blackColor,
      textColor: AppConfig.colors.whiteColor,
      fontSize: 14.0);
}

// will pop function
DateTime currentBackPressTime;
Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime) > Duration(seconds: 2)) {
    currentBackPressTime = now;
    toast(Get.context, "press again to exit");
    return Future.value(false);
  }
  return Future.value(true);
}
