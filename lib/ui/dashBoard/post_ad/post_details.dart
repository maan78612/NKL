import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/ad.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/widgets/my_button.dart';
import 'package:nlk/ui/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class ReviewAd extends StatelessWidget {
  final Ad ad;
  final List<Asset> assetImages;
  ReviewAd({this.ad, this.assetImages});
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (context, p, _) => Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: ListView(
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    TopBar(
                      withBackButton: true,
                      title: "Preview ad",
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Container(
                      height: 200,
                      child: assetImages.isEmpty
                          ? Container()
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: assetImages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: AssetThumb(
                                        asset: assetImages[index],
                                        width: 160,
                                        height: 160),
                                  ),
                                );
                              }),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    postDetails(),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      child: MyButton(
                        title: "Publish",
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.024,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      child: MyButton(
                        title: "Edit",
                        color: Colors.blueGrey,
                        onTap: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget postDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '\$',
              style: GoogleFonts.roboto(
                fontSize: 25.0,
                color: AppConfig.colors.themeColor,
                letterSpacing: 0.75,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              ad.price ?? "-",
              style: GoogleFonts.roboto(
                fontSize: 18.0,
                color: Colors.black,
                letterSpacing: 0.36,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.016,
        ),
        Text(
          '${ad.itemName ?? ""}',
          style: GoogleFonts.roboto(
            fontSize: 20.0,
            color: Colors.black,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w700,
            height: 0.75,
          ),
        ),
        SizedBox(
          height: Get.height * 0.016,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: AppConfig.colors.themeColor,
                ),
                SizedBox(
                  width: Get.width * 0.014,
                ),
                Text(
                  'Karachi, Pakistan',
                  style: GoogleFonts.roboto(
                    fontSize: 15.0,
                    color: const Color(0xFF1D2226).withOpacity(0.8),
                    height: 1.07,
                  ),
                ),
              ],
            ),
            Text(
              'May 20',
              style: GoogleFonts.roboto(
                fontSize: 12.0,
                color: const Color(0xFF1D2226).withOpacity(0.8),
                height: 1.08,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height * 0.034),
          child: Text(
            'Description',
            style: GoogleFonts.roboto(
              fontSize: 18.0,
              color: Colors.black,
              letterSpacing: 0.36,
              fontWeight: FontWeight.w700,
              height: 0.83,
            ),
          ),
        ),
        Text(
          '${ad.description ?? ""}',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 13.0,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
