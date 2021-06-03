import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';

class SuccessfullySignUpBottom extends StatefulWidget {
  @override
  _SuccessfullySignUpBottomState createState() =>
      _SuccessfullySignUpBottomState();
}

class _SuccessfullySignUpBottomState extends State<SuccessfullySignUpBottom> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      // Provider.of<AppProvider>(Get.context, listen: false).clearSignUpData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppConfig.colors.whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26), topRight: Radius.circular(26))),
        height: Get.height * .3,
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * .05, vertical: Get.height * .02),
        child: Column(
          children: [
            Image.asset(
              AppConfig.images.checkIcon,
              scale: 5,
            ),
            Text("Congratulations",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Color(0xff355A6F),
                      fontSize: Get.width * .04,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: Get.height * .02,
            ),
            Container(
              width: Get.width * .7,
              child: Text(
                  "Sign up has been successful. Now redirecting you to login page",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Color(0xffB4B7BA),
                      fontSize: Get.width * .033,
                    ),
                  )),
            ),
          ],
        ));
  }
}
