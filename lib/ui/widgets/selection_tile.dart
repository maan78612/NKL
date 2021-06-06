import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';

class SelectionTile extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;
  SelectionTile({this.text, this.onTap, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment(-0.06, 0.0),
        height: Get.height * 0.046,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected ? AppConfig.colors.themeColor : Colors.white,
          border: Border.all(width: 1.0, color: AppConfig.colors.themeColor),
        ),
        child: Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 19.0,
            color: !isSelected ? Colors.black : Colors.white,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
    ;
  }
}
