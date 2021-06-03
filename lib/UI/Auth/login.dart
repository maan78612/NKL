import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/Provider/appProvider.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  GlobalKey<FormState> _loginKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppConfig.colors.whiteColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(240),
            child: Container(
              padding: EdgeInsets.only(top: Get.height * 0.02),
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03, vertical: Get.height * 0.02),
              child: Container(
                width: Get.width,
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: Get.height * 0.17,
                      child: Image.asset(AppConfig.images.logo),
                    ),
                    Text(
                      'Welcome',
                      style: GoogleFonts.poppins(
                        fontSize: Get.height * 0.055,
                        color: AppConfig.colors.themeColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              color: Colors.red,
              margin: EdgeInsets.symmetric(
                  vertical: Get.height * 0.01, horizontal: Get.width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }
}
