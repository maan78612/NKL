import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';

class TopBar extends StatelessWidget {
  final bool withBackButton;
  final String title;
  TopBar({this.withBackButton = false, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          !withBackButton
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    icon: SvgPicture.string(
                      AppConfig.svgIcons.backButton,
                      width: 34.88,
                      height: 34.88,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              '$title',
              style: GoogleFonts.roboto(
                fontSize: 25.0,
                color: Colors.black,
                letterSpacing: 0.75,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
