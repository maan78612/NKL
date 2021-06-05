import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/categories.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:provider/provider.dart';

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

  final TextEditingController locationSearchController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appProvider, child) {
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
                ),
              ],
            )),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                searchBar(),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.02,
                      vertical: Get.height * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Catagories',
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 0.36,
                          fontWeight: FontWeight.w700,
                          height: 0.83,
                        ),
                      ),
                      Text(
                        'View All',
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: const Color(0xFF1D2226).withOpacity(0.64),
                          height: 1.06,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.04,
                      vertical: Get.height * 0.01),
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 0,
                            maxCrossAxisExtent: Get.width * .33,
                            crossAxisSpacing: 0,
                            childAspectRatio: .95,
                            mainAxisExtent: Get.height * 0.15),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            Category cat = appProvider.categoryList[index];
                            return category(title: cat.title, icon: cat.icon);
                          },
                          childCount: 6,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.02,
                      vertical: Get.height * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Trending Adds',
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 0.36,
                          fontWeight: FontWeight.w700,
                          height: 0.83,
                        ),
                      ),
                      Text(
                        'Recent Adds',
                        style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: const Color(0xFF1D2226).withOpacity(0.64),
                          height: 1.06,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.04,
                      vertical: Get.height * 0.01),
                  child: CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisSpacing: 15,
                          maxCrossAxisExtent: Get.width * .5,
                          crossAxisSpacing: 0,
                          childAspectRatio: 1.01,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return product(
                                isFav: index % 3 == 0 ? false : true,
                                location: "Karachi",
                                name: "Iphone",
                                pic: AppConfig.images.image1,
                                price: "2000");
                          },
                          childCount: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget searchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 10),
        Expanded(
          flex: 7,
          child: SizedBox(
            height: 50,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppConfig.colors.whiteColor,
              ),
              readOnly: false,
              controller: locationSearchController,
              onChanged: (val) {
                setState(() {});
              },
              decoration: InputDecoration(
                isDense: true,
                hintText: "Search Ads",
                suffixIcon: locationSearchController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            locationSearchController.clear();
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 0.8, color: AppConfig.colors.whiteColor),
                          ),
                          child: Icon(
                            Icons.clear,
                            color: AppConfig.colors.whiteColor,
                            size: 15,
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset(
                          AppConfig.images.searchIcon,
                          scale: 4,
                        )),
                fillColor: AppConfig.colors.themeColor,
                filled: true,
                hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppConfig.colors.whiteColor,
                    fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Color(0xffEEF9FF)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Color(0xffEEF9FF)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Color(0xffEEF9FF)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Color(0xffEEF9FF)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(color: Color(0xffEEF9FF)),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Refine ',
              style: GoogleFonts.roboto(
                fontSize: 13.0,
                color: AppConfig.colors.themeColor,
                letterSpacing: 0.26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget category({String icon, String title}) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: Get.height * 0.01, horizontal: Get.width * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            scale: 4,
          ),
          SizedBox(height: 10),
          Text(
            '$title',
            style: GoogleFonts.roboto(
              fontSize: 11.0,
              color: const Color(0xFF1D2226).withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget product({
    String pic,
    String name,
    bool isFav,
    String price,
    String location,
  }) {
    return GestureDetector(
      onTap: () {
        // widget.onTap();
        // dashProvider.selectedBranchModel = widget.branchModel;
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
                      child: Image.asset(pic, fit: BoxFit.cover),
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
                      "\$ $price",
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
                    "$name",
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
                        isFav == true
                            ? AppConfig.images.favoriteFillIcon
                            : AppConfig.images.favoriteIcon,
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
                    "$location",
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
