import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/ad.dart';
import 'package:nlk/ui/dashBoard/home/product_details.dart';

class Product extends StatelessWidget {
  final Ad ad;
  int index;
  Product({this.ad, index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails());
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 1,
                  color: AppConfig.colors.blackColor.withOpacity(.06))
            ],
            color: AppConfig.colors.whiteColor),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.asset(ad.images.first, fit: BoxFit.fitHeight),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "${ad.itemName ?? ""}",
                        style: GoogleFonts.poppins(
                            color: AppConfig.colors.blackColor,
                            fontSize: Get.height * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '5 minutes ago',
                      style: GoogleFonts.roboto(
                        fontSize: Get.height * 0.014,
                        color: const Color(0xFF070707).withOpacity(0.5),
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "\$ ${ad.price}",
                        style: GoogleFonts.poppins(
                            color: AppConfig.colors.themeColor,
                            fontSize: Get.height * 0.014),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppConfig.colors.themeColor,
                              size: 15,
                            ),
                            Text(
                              "Karachi",
                              style: GoogleFonts.poppins(
                                  color: AppConfig.colors.blackGrey,
                                  fontSize: Get.height * 0.012,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // dashProvider.addFavorite(foodModel: foodModel);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: .35,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppConfig.colors.blackColor
                                        .withOpacity(.8),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  index == 1
                                      ? AppConfig.images.favoriteFillIcon
                                      : AppConfig.images.favoriteIcon,
                                  height: Get.height * 0.016,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
