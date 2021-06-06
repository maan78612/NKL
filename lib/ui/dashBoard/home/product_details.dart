import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Container(
            width: Get.width,
            padding: EdgeInsets.only(top: Get.height * 0.02),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 2,
                      color: AppConfig.colors.blackColor.withOpacity(.16))
                ],
                color: AppConfig.colors.whiteColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: Get.width * 0.03),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(AppConfig.images.backIcon, scale: 5)),
                SizedBox(width: 20),
                Text(
                  'Details',
                  style: GoogleFonts.roboto(
                    fontSize: 22.0,
                    color: const Color(0xFF1C1C1C),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: Get.width * 0.03),
                Spacer(),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: Get.height * 0.02, horizontal: Get.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              postImages(),
              SizedBox(height: Get.height * 0.02),
              postDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget postImages() {
    return Container(
      height: Get.height * 0.25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppConfig.images.laptop,
                ),
              ),
            );
          }),
    );
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
              "2000",
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
          'Apple Iphone 7 Plus 32-GB RAM',
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
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet,  ',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 13.0,
            color: Colors.black,
          ),
        ),
        SizedBox(height: Get.height * 0.03),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircularProfileAvatar(
              "",
              child: Image.asset(
                AppConfig.images.person,
                fit: BoxFit.cover,
              ),
              borderWidth: 1,
              radius: Get.width * 0.1,
              borderColor: AppConfig.colors.themeColor,
            ),
            SizedBox(width: Get.width * .03),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subhan Ali',
                  style: GoogleFonts.roboto(
                    fontSize: 20.0,
                    color: Colors.black,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w700,
                    height: 0.75,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  'Member since Apr 2020',
                  style: GoogleFonts.roboto(
                    fontSize: 12.0,
                    color: const Color(0xFF1D2226).withOpacity(0.64),
                    height: 1.08,
                  ),
                ),
                SizedBox(height: Get.height * 0.008),
                Text(
                  'See Profile',
                  style: GoogleFonts.roboto(
                    fontSize: 10.0,
                    color: AppConfig.colors.themeColor,
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: Get.height * 0.01),
        Divider(
          thickness: 1,
          indent: Get.width * 0.07,
          endIndent: Get.width * 0.07,
        ),
        SizedBox(height: Get.height * 0.03),
        Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: Get.width * 0.45,
              height: Get.height * 0.05,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: AppConfig.colors.themeColor,
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFF707070),
                ),
              ),
              child: Text(
                'Start Chat',
                style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: AppConfig.colors.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(height: Get.height * 0.02),
      ],
    );
  }
}
