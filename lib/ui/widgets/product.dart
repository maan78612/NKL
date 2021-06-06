import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/ad.dart';
import 'package:nlk/ui/dashBoard/home/product_details.dart';

class Product extends StatelessWidget {
  final Ad ad;
  Product({this.ad});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 1,
                  color: AppConfig.colors.blackColor.withOpacity(.06))
            ],
            color: AppConfig.colors.whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.135,
                      child: Image.asset(ad.images.first, fit: BoxFit.cover),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 5, top: 15),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                      ),
                      color: AppConfig.colors.themeColor),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Text(
                      "\$ ${ad.price}",
                      style: GoogleFonts.poppins(
                          color: AppConfig.colors.whiteColor, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8, top: 10),
                  child: Text(
                    "${ad.itemName ?? ""}",
                    style: GoogleFonts.poppins(
                        color: AppConfig.colors.blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
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
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppConfig.colors.blackColor.withOpacity(.8),
                          ),
                        ),
                      ),
                      Image.asset(
                        /*  isFav == true
                            ? AppConfig.images.favoriteFillIcon
                            :*/
                        AppConfig.images.favoriteIcon,
                        scale: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: Get.width * .66,
              margin: EdgeInsets.only(left: 5, right: 5),
              child: Row(
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
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
