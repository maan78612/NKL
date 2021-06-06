import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/UI/Shared/Congratulations.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/dashBoard/mainDashBoard.dart';
import 'package:nlk/utilities/validator.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  ///////////login Controllers////////////
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
  ///////////SignUp Controllers////////////
  TextEditingController fullNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ///////////login focus node////////////
  FocusNode loginPassFocusNode = new FocusNode();
  FocusNode loginEmailFocusNode = new FocusNode();
  ///////////SignUp focus node////////////
  FocusNode fullNameFocusNode = new FocusNode();
  FocusNode numberFocusNode = new FocusNode();

  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode confirmPasswordFocusNode = new FocusNode();

  GlobalKey<FormState> _loginKey = new GlobalKey<FormState>();

  bool isShowPass = false;
  bool isShowPass1 = false;
  bool isEyeOpen = false;
  bool isEyeOpen1 = false;
  showPass() {
    setState(() {
      isShowPass = !isShowPass;
      isEyeOpen = !isEyeOpen;
    });
  }

  showPass1() {
    setState(() {
      isShowPass1 = !isShowPass1;
      isEyeOpen1 = !isEyeOpen1;
    });
  }

  TabController _controller;
  int _selectedIndex = 0;

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: AppConfig.colors.whiteColor,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color(0xffD1D4D8),
    ),
  );

  String _email, _password;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return Scaffold(
          backgroundColor: AppConfig.colors.whiteColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(240),
            child: Container(
              padding: EdgeInsets.only(top: Get.height * 0.02),
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03, vertical: Get.height * 0.02),
              child: Container(
                width: Get.width,
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: Get.height * 0.17,
                      child: Image.asset(AppConfig.images.logo),
                    ),
                    Text(
                      'Welcome',
                      style: GoogleFonts.poppins(
                        fontSize: Get.height * 0.055,
                        color: AppConfig.colors.themeColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: Get.height * 0.8,
              width: Get.width,
              margin: EdgeInsets.symmetric(
                  vertical: Get.height * 0.01, horizontal: Get.width * 0.02),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 80, right: 80),
                        width: Get.width * 0.7,
                        decoration: BoxDecoration(
                            //This is for background color
                            color: Colors.white.withOpacity(0.0),
                            //This is for bottom border that is needed
                            border: Border(
                                bottom: BorderSide(
                                    color: AppConfig.colors.whiteColor,
                                    width: 1))),
                        child: TabBar(
                          physics: NeverScrollableScrollPhysics(),
                          isScrollable: false,
                          labelStyle: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w700),
                          labelColor: AppConfig.colors.themeColor,
                          unselectedLabelColor: AppConfig.colors.blackColor,
                          unselectedLabelStyle: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          controller: _controller,
                          tabs: [
                            Tab(text: 'LOG IN'),
                            Tab(text: 'SIGN UP'),
                          ],
                        ),
                      ),
                    ),

                    // create widgets for each tab bar here
                    Expanded(
                      flex: 8,
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _controller,
                        children: [
                          // first tab bar view widget
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Text(
                                      'Email',
                                      style: GoogleFonts.poppins(
                                          color: AppConfig.colors.blackGrey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6.0),
                                      child: TextFormField(
                                        controller: loginEmailController,
                                        focusNode: loginEmailFocusNode,
                                        textInputAction: TextInputAction.next,
                                        validator: FieldValidator.validateEmail,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                        ),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: "email",
                                          fillColor:
                                              AppConfig.colors.whiteColor,
                                          filled: true,
                                          hintStyle: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  AppConfig.colors.hintColor),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.fieldBorderColor),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.fieldBorderColor),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.enableBorderColor),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.fieldBorderColor),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.fieldBorderColor),
                                          ),
                                        ),
                                        onEditingComplete: () {
                                          setState(() {
                                            loginEmailFocusNode.unfocus();
                                          });
                                        },
                                        onFieldSubmitted: (val) {
                                          setState(() {
                                            FocusScope.of(Get.context)
                                                .requestFocus(
                                                    loginPassFocusNode);
                                          });
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    Text(
                                      'Password',
                                      style: GoogleFonts.poppins(
                                          color: AppConfig.colors.blackGrey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6.0),
                                      child: TextFormField(
                                        controller: loginPassController,
                                        focusNode: loginPassFocusNode,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'password required';
                                          }
                                          return null;
                                        },
                                        obscureText: isShowPass,
                                        style:
                                            GoogleFonts.poppins(fontSize: 14),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: "name",
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              showPass();
                                            },
                                            child: Image.asset(
                                              !isEyeOpen
                                                  ? AppConfig.images.eyeOpen
                                                  : AppConfig.images.eyeClose,
                                              scale: 20,
                                              color: Color(0xffd1d4d8),
                                            ),
                                          ),
                                          fillColor:
                                              AppConfig.colors.whiteColor,
                                          filled: true,
                                          hintStyle: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  AppConfig.colors.hintColor),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.fieldBorderColor),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.fieldBorderColor),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.enableBorderColor),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.fieldBorderColor),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: AppConfig
                                                    .colors.fieldBorderColor),
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        child: Text('forgot password',
                                            style: GoogleFonts.poppins(
                                                color:
                                                    AppConfig.colors.themeColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13)),
                                        onPressed: () {
                                          // Get.bottomSheet(ForgotPassword(
                                          //   title: 'Forgot Password',
                                          // ));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: MaterialButton(
                                        elevation: 3,
                                        onPressed: () async {
                                          if (!_formKey.currentState
                                              .validate()) {
                                            return;
                                          }
                                          Get.to(DashBoard());
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        color: AppConfig.colors.themeColor,
                                        height: Get.height * .065,
                                        child: Center(
                                          child: Text(
                                            'LOG IN',
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppConfig
                                                    .colors.whiteColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.05,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // second tab bar view widget
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              key: _formKey1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Full name',
                                            style: GoogleFonts.poppins(
                                                color:
                                                    AppConfig.colors.blackGrey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6.0),
                                            child: TextFormField(
                                              controller: fullNameController,
                                              focusNode: fullNameFocusNode,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'name required';
                                                }
                                                return null;
                                              },
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "name",
                                                fillColor:
                                                    AppConfig.colors.whiteColor,
                                                filled: true,
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: AppConfig
                                                        .colors.hintColor),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .enableBorderColor),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Email',
                                            style: GoogleFonts.poppins(
                                                color:
                                                    AppConfig.colors.blackGrey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6.0),
                                            child: TextFormField(
                                              controller: emailController,
                                              focusNode: emailFocusNode,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validator:
                                                  FieldValidator.validateEmail,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "name",
                                                fillColor:
                                                    AppConfig.colors.whiteColor,
                                                filled: true,
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: AppConfig
                                                        .colors.hintColor),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .enableBorderColor),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                              ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                          Text(
                                            'Contact Number',
                                            style: GoogleFonts.poppins(
                                                color:
                                                    AppConfig.colors.blackGrey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6.0),
                                            child: TextFormField(
                                              controller: numberController,
                                              focusNode: numberFocusNode,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'contact number required';
                                                }
                                                return null;
                                              },
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "contact number",
                                                fillColor:
                                                    AppConfig.colors.whiteColor,
                                                filled: true,
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: AppConfig
                                                        .colors.hintColor),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .enableBorderColor),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                          Text(
                                            'Password',
                                            style: GoogleFonts.poppins(
                                                color:
                                                    AppConfig.colors.blackGrey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6.0),
                                            child: TextFormField(
                                              controller: passwordController,
                                              focusNode: passwordFocusNode,
                                              textInputAction:
                                                  TextInputAction.next,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'password required';
                                                }
                                                return null;
                                              },
                                              obscureText: isShowPass,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "name",
                                                fillColor:
                                                    AppConfig.colors.whiteColor,
                                                filled: true,
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: AppConfig
                                                        .colors.hintColor),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .enableBorderColor),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                              ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                          Text(
                                            'Confirm password',
                                            style: GoogleFonts.poppins(
                                                color:
                                                    AppConfig.colors.blackGrey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 6.0),
                                            child: TextFormField(
                                              controller:
                                                  confirmPasswordController,
                                              focusNode:
                                                  confirmPasswordFocusNode,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'confirm password error';
                                                } else if (appProvider
                                                        .isAcceptedConfirmPWDProvider ==
                                                    0) {
                                                  return 'password not match';
                                                }
                                                return null;
                                              },
                                              obscureText: isShowPass1,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14),
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "Confirm Password",
                                                fillColor:
                                                    AppConfig.colors.whiteColor,
                                                filled: true,
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: AppConfig
                                                        .colors.hintColor),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .enableBorderColor),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      color: AppConfig.colors
                                                          .fieldBorderColor),
                                                ),
                                              ),
                                              onFieldSubmitted: (value) {
                                                Provider.of<AppProvider>(
                                                        Get.context,
                                                        listen: false)
                                                    .matchPassProvider(
                                                        value,
                                                        passwordController.text,
                                                        confirmPasswordController
                                                            .text);
                                              },
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.05,
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: MaterialButton(
                                                elevation: 3,
                                                onPressed: () {
                                                  if (!_formKey1.currentState
                                                      .validate()) {
                                                    return;
                                                  }
                                                  Get.bottomSheet(
                                                      SuccessfullySignUpBottom(),
                                                      isDismissible: false,
                                                      enableDrag: false);
                                                },
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                color:
                                                    AppConfig.colors.themeColor,
                                                height: Get.height * .065,
                                                child: Center(
                                                  child: Text(
                                                    'SIGN UP',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppConfig
                                                            .colors.whiteColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
