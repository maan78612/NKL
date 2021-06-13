import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/ad.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/widgets/product.dart';
import 'package:nlk/ui/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class TrendingAdds extends StatefulWidget {
  @override
  _TrendingAddsState createState() => _TrendingAddsState();
}

class _TrendingAddsState extends State<TrendingAdds> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (context, p, _) => Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    TopBar(
                      withBackButton: false,
                      title: "Trending Ads",
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: Get.height * 0.01),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
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
                            )),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                  ],
                ),
              ),
            ));
  }
}
