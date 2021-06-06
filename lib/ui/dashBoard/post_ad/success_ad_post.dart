import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/dashBoard/mainDashBoard.dart';
import 'package:nlk/ui/widgets/my_button.dart';
import 'package:nlk/ui/widgets/top_bar.dart';
import 'package:nlk/utilities/routes.dart';
import 'package:provider/provider.dart';

class SuccessAdPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (context, p, _) => Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    TopBar(
                      withBackButton: true,
                      title: "Back",
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.height * 0.15,
                            height: Get.height * 0.15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppConfig.colors.themeColor,
                              border: Border.all(
                                width: 1.0,
                                color: AppConfig.colors.themeColor,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 64,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Text(
                            'Success!',
                            style: GoogleFonts.roboto(
                              fontSize: 30.0,
                              color: Colors.black,
                              letterSpacing: 0.8999999999999999,
                              fontWeight: FontWeight.w700,
                              height: 0.5,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Text(
                            'Your Ad posted Successfully ',
                            style: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: const Color(0xFF1D2226).withOpacity(0.8),
                              height: 0.87,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          MyButton(
                            title: "View ad",
                            onTap: () {
                              AppRoutes.makeFirst(context, DashBoard());
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.2,
                    ),
                  ],
                ),
              ),
            ));
  }
}
