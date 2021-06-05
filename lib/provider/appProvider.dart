import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/categories.dart';
import 'package:nlk/utilities/validator.dart';

class AppProvider extends ChangeNotifier {
  //////////////////////Login Sign Up/////////////////////////

  String app = "From app";
  ///////////login variables////////////
  bool passVisible = false;
  ///////////signUp variables////////////
  var isAcceptedConfirmPWDProvider = -1;
  var isAcceptedPWDProvider = -1;
  var isAcceptedEmail = -1;
  var pageIndex = 0;
  bool passVisibleSignUp = false;
  bool passVisibleSignUp2 = false;
  bool selectTerms = false;
  File image;

  Future<void> matchPassProvider(String value, pass, confrimPass) async {
    if (FieldValidator.validateConfirmPassword(value) ==
        "Confirm Password is Required") {
      isAcceptedConfirmPWDProvider = -1;
    } else if (pass == confrimPass) {
      isAcceptedConfirmPWDProvider = 1;
    } else {
      isAcceptedConfirmPWDProvider = 0;
    }

    notifyListeners();
  }

  selectTermToggle() {
    selectTerms = !selectTerms;
    notifyListeners();
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }

    notifyListeners();
  }

  Future<void> matchEmail(int index, String value) async {
    if (FieldValidator.validateEmail(value) ==
        "Please enter a valid Email Address") {
      isAcceptedEmail = 0;
    } else if (FieldValidator.validateEmail(value) == "Email is Required") {
      isAcceptedEmail = -1;
    } else {
      isAcceptedEmail = 1;
    }

    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////// DashBoard///////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

  int selectedIndex = 0;
  PageController pageController;

  dashBoardNavigation(int index) {
    selectedIndex = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);

    notifyListeners();
  }

  onInitDash() {
    pageController = PageController();
    categoryData();
    notifyListeners();
  }

  List<Category> categoryList = [];
  void categoryData() {
    categoryList.clear();
    categoryList
        .add(Category(icon: AppConfig.images.realEstate, title: "Real Estate"));
    categoryList.add(Category(icon: AppConfig.images.jobs, title: "Jobs"));
    categoryList
        .add(Category(icon: AppConfig.images.business, title: "Business"));
    categoryList
        .add(Category(icon: AppConfig.images.fashion, title: "Fashion"));
    categoryList.add(Category(icon: AppConfig.images.events, title: "Events"));
    categoryList.add(
        Category(icon: AppConfig.images.electronics, title: "Electronics"));

    print("${categoryList.length}");

    notifyListeners();
  }
}
