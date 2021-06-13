import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/modal/categories.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  CategoryWidget({this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: Get.height * 0.01, horizontal: Get.width * 0.035),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            category.icon,
            scale: Get.width * 0.011,
          ),
          SizedBox(height: 10),
          Text(
            '${category.title}',
            style: GoogleFonts.roboto(
              fontSize: 12.0,
              color: const Color(0xFF1D2226).withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
