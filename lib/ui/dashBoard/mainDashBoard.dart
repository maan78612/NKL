import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/dashBoard/chat/chat_people.dart';
import 'package:nlk/ui/dashBoard/post_ad/select_category.dart';
import 'package:nlk/ui/dashBoard/profile/profile.dart';
import 'package:nlk/ui/dashBoard/trending_add/trending_adds.dart';
import 'package:provider/provider.dart';

import 'Home/home.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  double kFontSize = 20;

  List<String> bottomNames = ["Home", "Trending", "Add", "Chat", "Profile"];
  List<IconData> bottomImages = [
    Icons.home_filled,
    Icons.trending_up,
    Icons.add_box,
    Icons.chat,
    Icons.person
  ];
  @override
  void initState() {
    Future.delayed(Duration(microseconds: 500), () {
      Provider.of<AppProvider>(context, listen: false).onInitDash();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appProvider, child) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Container(
                // decoration: BoxDecoration(
                //     boxShadow: [
                //       BoxShadow(
                //           spreadRadius: 2,
                //           blurRadius: 2,
                //           color: AppConfig.colors.blackColor.withOpacity(.16))
                //     ],
                //     color: AppConfig.colors.whiteColor,
                //     borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(15),
                //         bottomRight: Radius.circular(15))),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(top: 22),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           // Padding(
                //           //   padding: EdgeInsets.only(left: 15, right: 10),
                //           //   child: Image.asset(
                //           //     AppConfig.images.locationIcon,
                //           //     scale: 4,
                //           //   ),
                //           // ),
                //           // Padding(
                //           //   padding: EdgeInsets.only(left: Get.width * 0.03),
                //           //   child: Text(
                //           //     'Karachi, Pakistan',
                //           //     style: GoogleFonts.poppins(
                //           //       fontSize: 18.0,
                //           //       color: AppConfig.colors.themeColor,
                //           //       height: 1.06,
                //           //     ),
                //           //   ),
                //           // ),
                //           // Spacer(),
                //           // GestureDetector(
                //           //   onTap: () {
                //           //     Get.to(Notifications());
                //           //   },
                //           //   child: Padding(
                //           //     padding: EdgeInsets.only(right: 20),
                //           //     child: Image.asset(
                //           //       AppConfig.images.bellIcon,
                //           //       scale: 4,
                //           //     ),
                //           //   ),
                //           // ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                )),
        body: SizedBox.expand(
          child: PageView(
            controller: appProvider.pageController,
            onPageChanged: (index) {
              appProvider.dashBoardNavigation(index);
            },
            children: <Widget>[
              Home(),
              TrendingAdds(),
              SelectCategoryToPostAd(),
              ChatPeople(),
              Profile()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: appProvider.selectedIndex,
          // iconSize: Get.width * 0.05,
          showElevation: true, // use this to remove appBar's elevation
          containerHeight: 64,
          onItemSelected: (index) {
            appProvider.dashBoardNavigation(index);
          },
          items: 1 == 1
              ? List.generate(
                  bottomNames.length,
                  (index) => BottomNavyBarItem(
                      textAlign: TextAlign.center,
                      icon: Icon(
                        bottomImages[index],
                      ),
                      title: Text(
                        bottomNames[index],
                        style: GoogleFonts.poppins(
                            color: AppConfig.colors.themeColor,
                            fontSize: kFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      activeColor: AppConfig.colors.themeColor,
                      inactiveColor: AppConfig.colors.blackGrey),
                )
              : [
                  BottomNavyBarItem(
                      textAlign: TextAlign.center,
                      icon: Image.asset(
                        AppConfig.images.trending,
                        color: appProvider.selectedIndex != 1
                            ? AppConfig.colors.blackGrey
                            : AppConfig.colors.themeColor,
                        width: Get.width * 0.05,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        ' Trending',
                        style: GoogleFonts.poppins(
                            color: AppConfig.colors.themeColor,
                            fontSize: kFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      activeColor: AppConfig.colors.themeColor,
                      inactiveColor: AppConfig.colors.blackGrey),
                  BottomNavyBarItem(
                      textAlign: TextAlign.center,
                      icon: Icon(
                        Icons.add_box_sharp,
                      ),
                      title: Text(
                        ' Add',
                        style: GoogleFonts.poppins(
                            color: AppConfig.colors.themeColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      activeColor: AppConfig.colors.themeColor,
                      inactiveColor: AppConfig.colors.blackGrey),
                  BottomNavyBarItem(
                      textAlign: TextAlign.center,
                      icon: Icon(
                        Icons.message,
                      ),
                      title: Text(
                        'Chat',
                        style: GoogleFonts.poppins(
                            color: AppConfig.colors.themeColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      activeColor: AppConfig.colors.themeColor,
                      inactiveColor: AppConfig.colors.blackGrey),
                  BottomNavyBarItem(
                      textAlign: TextAlign.center,
                      icon: Icon(
                        Icons.person_rounded,
                      ),
                      title: Text(
                        ' Profile',
                        style: GoogleFonts.poppins(
                            color: AppConfig.colors.themeColor,
                            fontSize: kFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      activeColor: AppConfig.colors.themeColor,
                      inactiveColor: AppConfig.colors.blackGrey),
                ],
        ),
      );
    });
  }
}
