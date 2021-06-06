import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/dashBoard/chat/chat_people.dart';
import 'package:nlk/ui/dashBoard/post_ad/select_category.dart';
import 'package:nlk/ui/dashBoard/profile/profile.dart';
import 'package:provider/provider.dart';

import 'Home/home.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
            preferredSize: Size.fromHeight(70),
            child: Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 10),
                          child: Image.asset(
                            AppConfig.images.locationIcon,
                            scale: 4,
                          ),
                        ),
                        Text(
                          'Karachi, Pakistan',
                          style: GoogleFonts.poppins(
                            fontSize: 18.0,
                            color: AppConfig.colors.themeColor,
                            height: 1.06,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Image.asset(
                            AppConfig.images.bellIcon,
                            scale: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        body: SizedBox.expand(
          child: PageView(
            controller: appProvider.pageController,
            onPageChanged: (index) {
              appProvider.dashBoardNavigation(index);
            },
            children: <Widget>[
              Home(),
              SelectCategoryToPostAd(),
              ChatPeople(),
              Profile()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: appProvider.selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) {
            appProvider.dashBoardNavigation(index);
          },
          items: [
            BottomNavyBarItem(
                textAlign: TextAlign.center,
                icon: Icon(
                  Icons.home_filled,
                ),
                title: Text(
                  ' Home',
                  style: GoogleFonts.poppins(
                      color: AppConfig.colors.themeColor,
                      fontSize: 14,
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
                      fontSize: 14,
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
                      fontSize: 14,
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
                      fontSize: 14,
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
