import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color color;
  MyButton({this.title, this.onTap, this.color});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment(0.04, -0.07),
        width: 271.26,
        height: 54.57,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29.0),
          color: color ?? AppConfig.colors.themeColor,
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 25.0,
              color: Colors.white,
              letterSpacing: 0.75,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
