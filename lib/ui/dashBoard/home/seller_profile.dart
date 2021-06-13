import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/ad.dart';
import 'package:nlk/ui/widgets/product.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
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
                  'Seller Profile',
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
          height: Get.height,
          margin: EdgeInsets.symmetric(
              vertical: Get.height * 0.02, horizontal: Get.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '27',
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0,
                                  color: AppConfig.colors.themeColor,
                                  height: 1.13,
                                ),
                              ),
                              Text(
                                'Following',
                                style: GoogleFonts.roboto(
                                  fontSize: 13.0,
                                  color:
                                      const Color(0xFF1D2226).withOpacity(0.8),
                                  height: 1.08,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: Get.width * 0.03),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '100',
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0,
                                  color: AppConfig.colors.themeColor,
                                  height: 1.13,
                                ),
                              ),
                              Text(
                                'Followers',
                                style: GoogleFonts.roboto(
                                  fontSize: 13.0,
                                  color:
                                      const Color(0xFF1D2226).withOpacity(0.8),
                                  height: 1.08,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("chat");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.12,
                          height: Get.height * 0.027,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppConfig.colors.themeColor,
                          ),
                          child: Text(
                            'Chat',
                            style: GoogleFonts.roboto(
                              fontSize: Get.width * 0.03,
                              color: AppConfig.colors.whiteColor,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w700,
                              height: 0.8,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      GestureDetector(
                        onTap: () {
                          print("call");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.12,
                          height: Get.height * 0.027,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppConfig.colors.themeColor,
                          ),
                          child: Text(
                            'Call',
                            style: GoogleFonts.roboto(
                              fontSize: Get.width * 0.03,
                              color: AppConfig.colors.whiteColor,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w700,
                              height: 0.8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.01),
              sellerAdds(),
              SizedBox(height: Get.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget sellerAdds() {
    return Expanded(
      child:  Container(
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(10, (index) {
                Ad ad = Ad(
                    itemName: "Iphone",
                    images: [AppConfig.images.image1],
                    price: "200",
                    description: "This is fully ok",
                    location: Location(),
                    postedAt: "",
                    postedBy: "");
                return Product(
                  ad: ad,
                  index: index,
                );
              }),
            )),
      ),
    );
  }
}
