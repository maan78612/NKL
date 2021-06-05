import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Stack(
              children: [
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15, right: 6),
                            child: Image.asset(
                              AppConfig.images.locationIcon,
                              scale: 5,
                            ),
                          ),
                          Text(
                            'Karachi, Pakistan',
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              color: AppConfig.colors.themeColor,
                              height: 1.06,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
