import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/modal/ad.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/widgets/product.dart';
import 'package:nlk/ui/widgets/selection_tile.dart';
import 'package:nlk/ui/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class MyAds extends StatefulWidget {
  @override
  _MyAdsState createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  List<String> filters = ["All", "Active", "Expired"];
  int selectedIndex = 0;
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
                      withBackButton: true,
                      title: "Profile",
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    filter(),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.height * 0.01),
                        child: CustomScrollView(
                          shrinkWrap: false,
                          slivers: [
                            SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisSpacing: 15,
                                maxCrossAxisExtent: Get.width * .5,
                                crossAxisSpacing: 5,
                                childAspectRatio: 0.9,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
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
                                  );
                                },
                                childCount: 10,
                              ),
                            )
                          ],
                        ),
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

  Widget filter() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.04,
      ),
      child: Row(
          children: List.generate(3, (index) {
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SelectionTile(
            text: filters[index],
            isSelected: index == selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ));
      })),
    );
  }
}
