import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nlk/modal/categories.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/dashBoard/post_ad/create_post.dart';
import 'package:nlk/ui/widgets/category.dart';
import 'package:nlk/ui/widgets/my_button.dart';
import 'package:nlk/ui/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class SelectCategoryToPostAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
        builder: (context, p, _) => Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
              child: Column(
                children: [
                  TopBar(
                    withBackButton: true,
                    title: "What are you offering?",
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.height * 0.01),
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverGrid(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 0,
                                  maxCrossAxisExtent: Get.width * .33,
                                  crossAxisSpacing: 0,
                                  childAspectRatio: .95,
                                  mainAxisExtent: Get.height * 0.15),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              Category cat = p.categoryList[index];
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
                  Center(
                    child: TextButton(
                      child: Text("View more"),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  MyButton(
                    title: "Continue",
                    onTap: navigateToCreateAd,
                  ),
                ],
              ),
            ));
  }

  void navigateToCreateAd() {
    Get.to(CreateAd());
  }
}
