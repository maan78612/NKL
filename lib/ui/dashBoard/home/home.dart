import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/ad.dart';
import 'package:nlk/modal/categories.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/widgets/category.dart';
import 'package:nlk/ui/widgets/product.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController locationSearchController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    Provider.of<AppProvider>(context, listen: false).pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appProvider, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            width: Get.width,
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
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(appProvider.categoryList.length,
                            (index) {
                          Category cat = appProvider.categoryList[index];
                          return CategoryWidget(
                            category: cat,
                          );
                        }),
                      )),
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
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                    child: Center(
                      child: Scrollbar(
                        isAlwaysShown: true,
                        showTrackOnHover: true,
                        controller: _scrollController,
                        child: ListView(
                          controller: _scrollController,
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
                        ),
                      ),
                    ),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 10),
        Expanded(
          flex: 7,
          child: SizedBox(
            height: Get.height * 0.065,
            child: Center(
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                style: GoogleFonts.poppins(
                  fontSize: Get.height * 0.02,
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
                                  width: Get.height * 0.002,
                                  color: AppConfig.colors.whiteColor),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: AppConfig.colors.whiteColor,
                              size: Get.height * 0.015,
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Image.asset(
                            AppConfig.images.searchIcon,
                            scale: Get.height * 0.007,
                          )),
                  contentPadding: EdgeInsets.only(
                      top: Get.height * 0.01, left: Get.width * 0.015),
                  fillColor: AppConfig.colors.themeColor,
                  filled: true,
                  hintStyle: GoogleFonts.poppins(
                      fontSize: Get.width * 0.05,
                      color: AppConfig.colors.whiteColor,
                      fontWeight: FontWeight.bold),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffEEF9FF)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffEEF9FF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffEEF9FF)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffEEF9FF)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffEEF9FF)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              Get.bottomSheet(BottomSheetRefine(), isScrollControlled: true);
              // Get.to(CountryCity());
            },
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.01),
              child: Image.asset(AppConfig.images.filter,
                  scale: Get.height * 0.006),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomSheetRefine extends StatefulWidget {
  @override
  _BottomSheetRefineState createState() => _BottomSheetRefineState();
}

class _BottomSheetRefineState extends State<BottomSheetRefine> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appProvider, child) {
      return SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
              width: Get.width,
              height: Get.height * .55,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: Get.width * 0.03),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(AppConfig.images.backIcon,
                                scale: 5)),
                        Spacer(),
                        Text(
                          'Refine',
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
                  ),
                  SizedBox(height: 20),
                  heading("Refine Options"),
                  SizedBox(height: 20),
                  refineRows(
                      heading: "Category",
                      subHeading: "All Category",
                      img: AppConfig.images.dropDownIcon,
                      onChanged: () {}),
                  Divider(
                    endIndent: Get.width * 0.07,
                    indent: Get.width * 0.07,
                    thickness: 2,
                  ),
                  refineRows(
                      heading: "Location",
                      subHeading: "Karachi",
                      img: AppConfig.images.dropDownIcon,
                      onChanged: () {
                        Get.bottomSheet(BottomSheetLocation(),
                            isScrollControlled: true);
                      }),
                  Divider(
                    endIndent: Get.width * 0.07,
                    indent: Get.width * 0.07,
                    thickness: 2,
                  ),
                  distanceRow(
                      heading: "Distance",
                      subHeading: "${appProvider.refineDistance} km",
                      img: AppConfig.images.dropDownIcon,
                      onChanged: (value) {
                        appProvider.selectDistanceFunc(distance: value);
                      },
                      appProvider: appProvider),
                  Spacer(),
                ],
              )),
        ),
      );
    });
  }

  Widget heading(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppConfig.colors.lightBlue,
          border: Border(
              top: BorderSide(color: AppConfig.colors.themeColor, width: 1),
              bottom: BorderSide(color: AppConfig.colors.themeColor, width: 1)),
        ),
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.015, horizontal: Get.width * 0.02),
        child: Text(
          '$title',
          style: GoogleFonts.roboto(
            fontSize: 19.0,
            color: AppConfig.colors.textColor,
            height: 1.05,
          ),
        ),
      ),
    );
  }

  _dropdownField(
      {String hintText,
      String img,
      List<Category> itemsList,
      Category selectedItem,
      Function onChanged}) {
    print("items list length = ${itemsList.length}");
    return itemsList.length == 0
        ? Container()
        : Container(
            width: Get.width * 0.45,
            height: Get.height * 0.052,
            margin: EdgeInsets.symmetric(
              vertical: Get.height * 0.03,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: AppConfig.colors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1F54C3).withOpacity(0.15),
                  offset: Offset(0, 6.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: Get.width * 0.025),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    constraints: BoxConstraints(maxWidth: Get.width * 0.54),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: Image.asset(AppConfig.images.dropDownIcon,
                            scale: 3),
                        items: List.generate(itemsList.length, (index) {
                          return DropdownMenuItem(
                            child: ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: Get.width * 0.4),
                              child: Text(
                                itemsList[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            value: itemsList[index],
                          );
                        }),
                        hint: Text("$hintText",
                            style: GoogleFonts.roboto(
                              fontSize: 13.0,
                              color: const Color(0xFF1D2226).withOpacity(0.4),
                              height: 1.08,
                            )),
                        value: selectedItem,
                        onChanged: onChanged,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.025),
              ],
            ),
          );
  }

  Widget refineRows(
      {String heading, String img, String subHeading, Function onChanged}) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: Get.width,
        height: Get.height * 0.052,
        margin: EdgeInsets.symmetric(
          vertical: Get.height * 0.01,
          horizontal: Get.width * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$heading',
              style: GoogleFonts.roboto(
                fontSize: Get.width * 0.04,
                color: AppConfig.colors.textColor2,
                height: 1.06,
              ),
            ),
            Spacer(),
            Text(
              '$subHeading',
              style: GoogleFonts.roboto(
                fontSize: Get.width * 0.04,
                color: Colors.black,
                height: 1.06,
              ),
            ),
            SizedBox(width: 10),
            Image.asset(AppConfig.images.dropDownIcon,
                scale: Get.width * 0.012),
          ],
        ),
      ),
    );
  }

  Widget distanceRow(
      {String heading,
      String img,
      String subHeading,
      Function onChanged,
      AppProvider appProvider}) {
    return Container(
      width: Get.width,
      height: Get.height * 0.052,
      margin: EdgeInsets.symmetric(
        vertical: Get.height * 0.01,
        horizontal: Get.width * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$heading',
            style: GoogleFonts.roboto(
              fontSize: Get.width * 0.04,
              color: AppConfig.colors.textColor2,
              height: 1.06,
            ),
          ),
          Spacer(),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppConfig.colors.themeColor,
              inactiveTrackColor: AppConfig.colors.fieldBorderColor,
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 3.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
              thumbColor: AppConfig.colors.themeColor,
              overlayColor: AppConfig.colors.enableBorderColor,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: AppConfig.colors.themeColor,
              inactiveTickMarkColor: AppConfig.colors.fieldBorderColor,
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: AppConfig.colors.themeColor,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            child: Container(
              width: Get.width * 0.55,
              child: Slider(
                value: appProvider.refineDistance,
                min: 0,
                max: 30,
                divisions: 30,
                label: '${appProvider.refineDistance}',
                onChanged: onChanged,
              ),
            ),
          ),
          Spacer(),
          Text(
            '$subHeading',
            style: GoogleFonts.roboto(
              fontSize: Get.width * 0.04,
              color: Colors.black,
              height: 1.06,
            ),
          ),
          SizedBox(width: 10),
          Image.asset(AppConfig.images.dropDownIcon, scale: Get.width * 0.012),
        ],
      ),
    );
  }
}

class BottomSheetLocation extends StatefulWidget {
  @override
  _BottomSheetLocationState createState() => _BottomSheetLocationState();
}

class _BottomSheetLocationState extends State<BottomSheetLocation> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appProvider, child) {
      return SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
              width: Get.width,
              height: Get.height * .75,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: Get.width * 0.03),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(AppConfig.images.backIcon,
                                scale: 5)),
                        Spacer(),
                        Text(
                          'Choose your location',
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
                  ),
                  SizedBox(height: 20),
                  heading("YOUR LOCATION"),
                  SizedBox(height: 20),
                  refineRows(
                      heading: "Search location",
                      img: AppConfig.images.locationSearch,
                      onChanged: () {}),
                  Divider(
                    endIndent: Get.width * 0.07,
                    indent: Get.width * 0.07,
                    thickness: 2,
                  ),
                  refineRows(
                      heading: "Use current Location",
                      img: AppConfig.images.currentLocation,
                      onChanged: () {}),
                  Divider(
                    endIndent: Get.width * 0.07,
                    indent: Get.width * 0.07,
                    thickness: 2,
                  ),
                  Spacer(),
                  heading("RECENT LOCATIONS"),
                  Column(
                    children: List.generate(3, (index) {
                      String loc = appProvider.recentLocation[index];
                      return recentLocation(
                          heading: "$loc",
                          img: AppConfig.images.tick,
                          index: index,
                          onChanged: () {});
                    }),
                  ),
                  Spacer(),
                ],
              )),
        ),
      );
    });
  }

  Widget heading(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppConfig.colors.lightBlue,
          border: Border(
              top: BorderSide(color: AppConfig.colors.themeColor, width: 1),
              bottom: BorderSide(color: AppConfig.colors.themeColor, width: 1)),
        ),
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.015, horizontal: Get.width * 0.02),
        child: Text(
          '$title',
          style: GoogleFonts.roboto(
            fontSize: 19.0,
            color: AppConfig.colors.textColor,
            height: 1.05,
          ),
        ),
      ),
    );
  }

  Widget refineRows({String heading, String img, Function onChanged}) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: Get.width,
        height: Get.height * 0.052,
        margin: EdgeInsets.symmetric(
          vertical: Get.height * 0.01,
          horizontal: Get.width * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(img, scale: 4),
            SizedBox(width: 10),
            Text(
              '$heading',
              style: GoogleFonts.roboto(
                fontSize: 17.0,
                color: AppConfig.colors.textColor2,
                height: 1.06,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget recentLocation(
      {String heading, String img, Function onChanged, int index}) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: Get.width,
        height: Get.height * 0.052,
        margin: EdgeInsets.symmetric(
          vertical: Get.height * 0.01,
          horizontal: Get.width * 0.04,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$heading',
              style: GoogleFonts.roboto(
                fontSize: 17.0,
                color: AppConfig.colors.textColor2,
                height: 1.06,
              ),
            ),
            Spacer(),
            if (index == 1) Image.asset(img, scale: 4),
          ],
        ),
      ),
    );
  }

  Widget distanceRow(
      {String heading,
      String img,
      String subHeading,
      Function onChanged,
      AppProvider appProvider}) {
    return Container(
      width: Get.width,
      height: Get.height * 0.052,
      margin: EdgeInsets.symmetric(
        vertical: Get.height * 0.01,
        horizontal: Get.width * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$heading',
            style: GoogleFonts.roboto(
              fontSize: 17.0,
              color: AppConfig.colors.textColor2,
              height: 1.06,
            ),
          ),
          Spacer(),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: AppConfig.colors.themeColor,
              inactiveTrackColor: AppConfig.colors.fieldBorderColor,
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 3.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
              thumbColor: AppConfig.colors.themeColor,
              overlayColor: AppConfig.colors.enableBorderColor,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: AppConfig.colors.themeColor,
              inactiveTickMarkColor: AppConfig.colors.fieldBorderColor,
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: AppConfig.colors.themeColor,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            child: Container(
              width: Get.width * 0.55,
              child: Slider(
                value: appProvider.refineDistance,
                min: 0,
                max: 30,
                divisions: 30,
                label: '${appProvider.refineDistance}',
                onChanged: onChanged,
              ),
            ),
          ),
          Spacer(),
          Text(
            '$subHeading',
            style: GoogleFonts.roboto(
              fontSize: 17.0,
              color: Colors.black,
              height: 1.06,
            ),
          ),
          SizedBox(width: 10),
          Image.asset(AppConfig.images.dropDownIcon, scale: 3),
        ],
      ),
    );
  }
}
