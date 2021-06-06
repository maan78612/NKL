import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/categories.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/dashBoard/home/product_details.dart';
import 'package:nlk/ui/widgets/category.dart';
import 'package:nlk/utilities/validator.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController locationSearchController =
      TextEditingController();

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
                            return CategoryWidget(
                              category: cat,
                            );
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
          child: InkWell(
            onTap: () {
              Get.bottomSheet(BottomSheetRefine(), isScrollControlled: true);
            },
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
        ),
      ],
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
        Get.to(() => ProductDetails());
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

class BottomSheetRefine extends StatefulWidget {
  @override
  _BottomSheetRefineState createState() => _BottomSheetRefineState();
}

class _BottomSheetRefineState extends State<BottomSheetRefine> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController kilometerController = TextEditingController();

  FocusNode fromFocusNode = new FocusNode();
  FocusNode toFocusNode = new FocusNode();
  FocusNode kilometerFocusNode = new FocusNode();
  @override
  void dispose() {
    kilometerController.clear();
    toController.clear();
    fromController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          child:
                              Image.asset(AppConfig.images.backIcon, scale: 5)),
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
                Spacer(),
                heading("Choose Category   "),
                Container(
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
                      Text(
                        'Select Category',
                        style: GoogleFonts.roboto(
                          fontSize: 13.0,
                          color: const Color(0xFF1D2226).withOpacity(0.4),
                          height: 1.08,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(AppConfig.images.dropDownIcon,
                              scale: 3)),
                      SizedBox(width: Get.width * 0.025),
                    ],
                  ),
                ),
                heading("Price Range   "),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Get.height * 0.02,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'From',
                              style: GoogleFonts.roboto(
                                fontSize: 13.0,
                                color: const Color(0xFF1D2226).withOpacity(0.8),
                                height: 1.08,
                              ),
                            ),
                            Container(
                                width: Get.width * 0.28,
                                height: Get.height * 0.048,
                                margin: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.01,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: AppConfig.colors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF1F54C3)
                                          .withOpacity(0.15),
                                      offset: Offset(0, 6.0),
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: fromController,
                                  focusNode: fromFocusNode,
                                  textInputAction: TextInputAction.next,
                                  validator: FieldValidator.validateEmail,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 25),
                                    suffixIcon: Icon(
                                      Icons.attach_money_sharp,
                                      color: AppConfig.colors.themeColor,
                                    ),
                                    isDense: true,
                                    hintText: "0",
                                    fillColor: AppConfig.colors.whiteColor,
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: AppConfig.colors.hintColor),
                                    border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    focusedBorder: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    enabledBorder: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    errorBorder: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    disabledBorder: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                  ),
                                  onEditingComplete: () {
                                    setState(() {
                                      fromFocusNode.unfocus();
                                    });
                                  },
                                  onFieldSubmitted: (val) {
                                    setState(() {
                                      FocusScope.of(Get.context)
                                          .requestFocus(toFocusNode);
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: Get.height * 0.02,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'To',
                              style: GoogleFonts.roboto(
                                fontSize: 13.0,
                                color: const Color(0xFF1D2226).withOpacity(0.8),
                                height: 1.08,
                              ),
                            ),
                            Container(
                                width: Get.width * 0.28,
                                height: Get.height * 0.048,
                                margin: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.01,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: AppConfig.colors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF1F54C3)
                                          .withOpacity(0.15),
                                      offset: Offset(0, 6.0),
                                      blurRadius: 20.0,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: toController,
                                  focusNode: toFocusNode,
                                  textInputAction: TextInputAction.next,
                                  validator: FieldValidator.validateEmail,
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                  ),
                                  textAlignVertical: TextAlignVertical.center,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  onFieldSubmitted: (val) {
                                    setState(() {
                                      FocusScope.of(Get.context)
                                          .requestFocus(kilometerFocusNode);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 5, left: 25),
                                    suffixIcon: Icon(
                                      Icons.attach_money_sharp,
                                      color: AppConfig.colors.themeColor,
                                    ),
                                    isDense: true,
                                    hintText: "0",
                                    fillColor: AppConfig.colors.whiteColor,
                                    filled: true,
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: AppConfig.colors.hintColor),
                                    border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    focusedBorder: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    enabledBorder: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    errorBorder: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                    disabledBorder: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(12.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        )),
                                  ),
                                  onEditingComplete: () {
                                    setState(() {
                                      fromFocusNode.unfocus();
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                heading("Location   "),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: Get.height * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Within',
                        style: GoogleFonts.roboto(
                          fontSize: 13.0,
                          color: const Color(0xFF1D2226).withOpacity(0.8),
                          height: 1.08,
                        ),
                      ),
                      Container(
                          width: Get.width * 0.28,
                          height: Get.height * 0.048,
                          margin: EdgeInsets.symmetric(
                            vertical: Get.height * 0.01,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: AppConfig.colors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xFF1F54C3).withOpacity(0.15),
                                offset: Offset(0, 6.0),
                                blurRadius: 20.0,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: kilometerController,
                            focusNode: kilometerFocusNode,
                            textInputAction: TextInputAction.done,
                            validator: FieldValidator.validateEmail,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5, left: 25),
                              suffixIcon: Icon(
                                Icons.attach_money_sharp,
                                color: AppConfig.colors.themeColor,
                              ),
                              isDense: true,
                              hintText: "0",
                              fillColor: AppConfig.colors.whiteColor,
                              filled: true,
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppConfig.colors.hintColor),
                              border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                              focusedBorder: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                              enabledBorder: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                              errorBorder: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                              disabledBorder: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                            ),
                            onEditingComplete: () {
                              setState(() {
                                fromFocusNode.unfocus();
                              });
                            },
                            keyboardType: TextInputType.number,
                          )),
                    ],
                  ),
                ),
                Spacer(),
              ],
            )),
      ),
    );
  }

  Widget heading(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: Get.width * 0.5,
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.015, horizontal: Get.width * 0.02),
        color: AppConfig.colors.lightBlue,
        child: Text(
          '$title',
          style: GoogleFonts.roboto(
            fontSize: 18.0,
            color: Colors.black,
            letterSpacing: 0.36,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
