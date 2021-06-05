import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nlk/constants/app_constants.dart';

import 'Auth/loginSignUp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToNext() {
    Future.delayed(
        Duration(milliseconds: 7500), () => Get.offAll(() => Login()));
  }

  @override
  void initState() {
    navigateToNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment(-0.04, -0.01),
      decoration: BoxDecoration(color: AppConfig.colors.themeColor),
      child: Center(
        child: Image.asset(
          AppConfig.images.splash,
          scale: 5,
        ),
      ),
    ));
  }
}
