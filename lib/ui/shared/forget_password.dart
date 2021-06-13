import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/utilities/validator.dart';

class ForgotPasswordDialog extends StatefulWidget {
  @override
  _ForgotPasswordDialogState createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCon = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height * .5,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.01),
              width: Get.width * .17,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * .02, horizontal: Get.width * .07),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: Get.height * .055,
                      child: Image.asset(AppConfig.images.changePasswordIcon,
                          color: AppConfig.colors.themeColor)),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  Text('Forgot Password',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: AppConfig.colors.blackGrey,
                              fontWeight: FontWeight.w600,
                              fontSize: Get.width * .04))),
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * .06),
                    child: Text(
                      "Please enter your registered email to receive password reset link.",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: Get.width * .04,
                      )),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 4),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * .035,
                            )),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        _textFormFiled('Please enter your registered email',
                            emailCon, FieldValidator.validateEmail)
                      ],
                    ),
                  ),
                  // Spacer(),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        Get.back();
                        // Provider.of<SignUpProvider>(context, listen: false)
                        //     .startLoading();
                        // Provider.of<SignUpProvider>(context, listen: false)
                        //     .forgotPassword(emailCon.text);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.height * .06,
                      width: Get.width,
                      margin: EdgeInsets.symmetric(horizontal: Get.width * .05),
                      decoration: BoxDecoration(
                          color: AppConfig.colors.themeColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'PROCEED',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: Get.width * .04,
                        )),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textFormFiled(
      String hint, TextEditingController tc, Function validator) {
    return Padding(
      padding: EdgeInsets.only(bottom: Get.height * .02),
      child: TextFormField(
        controller: tc,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          hintStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: Get.width * .032,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold)),
          labelStyle: GoogleFonts.lato(
              textStyle: TextStyle(
            fontSize: Get.width * .032,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          )),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              width: 0.6,
              color: AppConfig.colors.fieldBorderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              width: 0.6,
              color: AppConfig.colors.themeColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 0.6, color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 0.6, color: Colors.red),
          ),
          errorStyle: TextStyle(fontSize: Get.height * .012),
        ),
        style:
            GoogleFonts.lato(textStyle: TextStyle(fontSize: Get.height * .02)),
        cursorColor: Colors.black,
        textAlign: TextAlign.left,
        enabled: true,
        validator: validator,
        onFieldSubmitted: (value) {},
      ),
    );
  }
}
