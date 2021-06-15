import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/dashBoard/profile/my_ads.dart';
import 'package:nlk/ui/shared/notifications.dart';
import 'package:nlk/ui/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  // items data

  List<String> titles = [
    "Personal Info",
    "My Ads",
    "My Favorite Ads",
    "Notifications",
    "Help Center",
    "Rate Us",
    "Log out"
  ];
  List<String> subTitles = [
    "Name,Email,....",
    "Ads posted by you",
    "Ads marked as favourite by you",
    "Updates about communication",
    "FAQ,Legal Terms",
    "Rate this app",
    "Log out from pp"
  ];
  static List<String> iconsList = [
    AppConfig.svgIcons.user,
    AppConfig.svgIcons.ad,
    AppConfig.svgIcons.heart,
    AppConfig.svgIcons.notification,
    AppConfig.svgIcons.helpCenter,
    AppConfig.svgIcons.star,
    AppConfig.svgIcons.logout
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (context, p, _) => Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      TopBar(
                        withBackButton: false,
                        title: "Profile",
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      userHeader(),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      profileOptions(),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget userHeader() {
    return Column(
      children: [
        Container(
          alignment: Alignment(0.02, -0.23),
          width: 59.0,
          height: 56.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(29.5, 28.0)),
            color: AppConfig.colors.lightBlue,
            border: Border.all(
              width: 1.0,
              color: AppConfig.colors.themeColor,
            ),
          ),
          child: SvgPicture.string(
            AppConfig.svgIcons.user,
            width: 28.62,
            height: 28.62,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
          child: Text(
            'Subhan Ali',
            style: GoogleFonts.roboto(
              fontSize: 20.0,
              color: Colors.black,
              letterSpacing: 1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          'Useremail@gmail.com',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20.0,
            color: AppConfig.colors.blackGrey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
          child: Container(
            height: 1,
            width: Get.width * 0.8,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget profileOptions() {
    return Column(
      children: List.generate(titles.length, (index) {
        return item(index: index);
      }),
    );
  }

  Widget item({int index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () => onTapped(index),
        leading: Container(
          // height: Get.width * 0.11,
          width: Get.width * 0.11,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppConfig.colors.lightBlue,
            border: Border.all(
              width: 1.0,
              color: AppConfig.colors.themeColor,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.02),
            child: SvgPicture.string(
              iconsList[index],
              width: Get.width * 0.4,
              height: Get.width * 0.4,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titles[index],
              style: GoogleFonts.roboto(
                fontSize: 18.0,
                color: Colors.black,
                letterSpacing: 0.36,
                fontWeight: FontWeight.w700,
                height: 0.83,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              subTitles[index],
              style: GoogleFonts.roboto(
                fontSize: 13.0,
                color: const Color(0xFF1D2226).withOpacity(0.4),
                height: 1.08,
              ),
            )
          ],
        ),
      ),
    );
  }

  //on iTem Tapped
  void onTapped(int index) {
    switch (index) {
      case 0:
        {}
        break;
      case 1:
        {
          Get.to(MyAds());
        }
        break;
      case 2:
        {}
        break;
      case 3:
        {
          Get.to(Notifications());
        }
        break;
      case 4:
        {}
        break;
      case 5:
        {}
        break;
      case 6:
        {}
        break;
      case 7:
        {}
        break;
      default:
        {}
        break;
    }
  }
}
