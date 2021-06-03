import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nlk/UI/Shared/Congratulations.dart';
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

  final PageController signUpPageController = PageController();

  ///////////login Controllers////////////
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
  ///////////SignUp Controllers////////////
  TextEditingController fullNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ///////////login focus node////////////
  FocusNode loginPassFocusNode = new FocusNode();
  FocusNode loginEmailFocusNode = new FocusNode();
  ///////////SignUp focus node////////////
  FocusNode firstNameFocusNode = new FocusNode();
  FocusNode lastNameFocusNode = new FocusNode();
  FocusNode schoolFocusNode = new FocusNode();
  FocusNode majorFocusNode = new FocusNode();
  FocusNode jobFocusNode = new FocusNode();
  FocusNode subjectFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode confirmPasswordFocusNode = new FocusNode();

  bool isLogin = false;

  void onLoginSignUp(bool isLogin) {
    this.isLogin = isLogin;

    notifyListeners();
  }

  Future<void> matchPassProvider(int index, String value) async {
    if (FieldValidator.validateConfirmPassword(value) ==
        "Confirm Password is Required") {
      isAcceptedConfirmPWDProvider = -1;
    } else if (passwordController.value.text.toString() ==
        confirmPasswordController.value.text.toString()) {
      isAcceptedConfirmPWDProvider = 1;
    } else {
      isAcceptedConfirmPWDProvider = 0;
    }

    notifyListeners();
  }

  validateSignUpForm1(GlobalKey<FormState> formKey, int id) {
    if (formKey.currentState.validate()) {
      signUpPageController.jumpToPage(1);
      pageIndex = 1;
    }
    notifyListeners();
  }

  validateSignUpForm2(GlobalKey<FormState> formKey, int id) {
    if (formKey.currentState.validate()) {
      matchPassProvider(8, passwordController.value.text.toString());

      if (passwordController.value.text.toString() !=
          confirmPasswordController.value.text.toString()) {
        Fluttertoast.showToast(
            msg: 'Password does not match', backgroundColor: Colors.red);
        print("aaaaaa");
      } else if (selectTerms == false) {
        print("bbbbbb");
        Fluttertoast.showToast(msg: 'Please accept the terms & conditions');
      } else {
        print("cccccccccc");
        clearSignUpData();
        Get.bottomSheet(SuccessfullySignUpBottom(),
            isDismissible: false, enableDrag: false);
      }
    } else {
      print("1111111111");
    }
    notifyListeners();
  }

  clearSignInData() {
    loginEmailController.clear();
    loginPassController.clear();

    notifyListeners();
  }

  clearSignUpData() {
    fullNameController.clear();
    contactNumberController.clear();
    emailController.clear();

    passwordController.clear();
    confirmPasswordController.clear();

    isAcceptedPWDProvider = -1;
    isAcceptedConfirmPWDProvider = -1;
    isAcceptedEmail = -1;

    selectTerms = false;
    pageIndex = 0;

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

}
