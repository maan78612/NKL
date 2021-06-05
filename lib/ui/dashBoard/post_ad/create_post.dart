import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/ad.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/dashBoard/post_ad/post_details.dart';
import 'package:nlk/ui/widgets/my_button.dart';
import 'package:nlk/ui/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class CreateAd extends StatefulWidget {
  @override
  _CreateAdState createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  TextEditingController titleCont = TextEditingController();

  TextEditingController desCont = TextEditingController();

  TextEditingController priceCont = TextEditingController();

  TextEditingController locationCont = TextEditingController();

  List<Asset> images = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (context, p, _) => Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: ListView(
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    TopBar(
                      withBackButton: true,
                      title: "Create Ad",
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    inputForm(),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                      child: MyButton(
                        title: "Review ad",
                        onTap: reviewAd,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget inputForm() {
    return Column(
      children: [
        imageSlideShow(),
        textField(controller: titleCont, hint: "Ad title", index: 0),
        textField(controller: priceCont, hint: "Price", index: 1),
        textField(controller: locationCont, hint: "Location", index: 2),
        textField(controller: desCont, hint: "Description", index: 3),
      ],
    );
  }

  Widget imageSlideShow() {
    return Container(
      height: 200,
      child: images.isEmpty
          ? GestureDetector(
              onTap: () async {
                images = await MultiImagePicker.pickImages(maxImages: 5);
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          AppConfig.colors.enableBorderColor.withOpacity(0.4),
                      width: 1),
                  borderRadius: BorderRadius.circular(20),
                  color: AppConfig.colors.lightBlue,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        color: AppConfig.colors.themeColor,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Images"),
                    ],
                  ),
                ),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AssetThumb(
                        asset: images[index], width: 160, height: 160),
                  ),
                );
              }),
    );
  }

  Widget textField({TextEditingController controller, String hint, int index}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
          color: AppConfig.colors.enableBorderColor.withOpacity(0.4)),
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: (v) {
          if (v.isEmpty) {
            return "required field";
          } else {
            return null;
          }
        },
        keyboardType: index == 1 ? TextInputType.phone : TextInputType.text,
        inputFormatters:
            index == 1 ? [FilteringTextInputFormatter.digitsOnly] : [],
        maxLines: index == 3 ? 5 : 1,
        decoration: InputDecoration(
            isDense: true,
            hintText: hint ?? "",
            fillColor: AppConfig.colors.lightBlue,
            filled: true,
            hintStyle:
                TextStyle(fontSize: 12, color: AppConfig.colors.blackColor),
            enabledBorder: border,
            disabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
            focusedErrorBorder: border),
      ),
    );
  }

  //review ad
  void reviewAd() {
    Ad ad = Ad(
        itemName: titleCont.text,
        price: priceCont.text,
        location: Location(),
        description: desCont.text,
        images: []);

    Get.to(ReviewAd(
      ad: ad,
      assetImages: images,
    ));
  }
}
