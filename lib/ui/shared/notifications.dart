import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/provider/notificationScroll.dart';
import 'package:nlk/ui/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.colors.whiteColor,
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          TopBar(
            withBackButton: true,
            title: "Notifications",
          ),
          Expanded(
            child: Center(
              child: Container(
                // height: Get.height * 0.8,
                child: ChangeNotifierProvider.value(
                  value: ScrollEventNotifier(false),
                  child: Builder(builder: (context) {
                    var scrollListener =
                        Provider.of<ScrollEventNotifier>(context);
                    return NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollStartNotification) {
                            scrollListener.isScrolling = true;
                          } else if (notification is ScrollEndNotification) {
                            scrollListener.isScrolling = false;
                          }
                          return true;
                        },
                        child: ListView(
                            children: List.generate(15, (index) {
                          return _cardDetails(
                              index, scrollListener.isScrolling);
                        })));
                  }),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
        ],
      ),
    );
  }

  Widget _cardDetails(index, bool isScrolling) {
    print("$isScrolling");
    return TweenAnimationBuilder(
        tween: Tween(
          begin: isScrolling ? 0.0 : 0.5,
          end: isScrolling ? 0.5 : 0.0,
        ),
        duration: Duration(milliseconds: 200),
        builder: (_, double rotation, _child) {
          return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(rotation),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => Practice()));
                  },
                  child: Container(
                    height: 91,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: Get.width * 0.01),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF1400FF),
                              const Color(0xff267EB5),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 0.8],
                            tileMode: TileMode.clamp,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              offset: Offset(0.0, 1.5),
                              blurRadius: 1.5,
                            ),
                          ]),
                      child: Row(children: [
                        //  SizedBox(height:100),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Image.asset(
                                  AppConfig.images.bellIcon,
                                  width: 37,
                                  height: 37,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 5,
                          child: Container(
                            //width:200,
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, bottom: 5),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 7,
                                          child: Text(
                                            'New Notification ',
                                            style: TextStyle(
                                                color:
                                                    AppConfig.colors.whiteColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        //Spacer(),
                                        // SizedBox(width: 160,),
                                        Expanded(
                                          flex: 3,
                                          child: Card(
                                            elevation: 5,
                                            color: AppConfig.colors.whiteColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            child: Center(
                                              child: Text(
                                                '10-05-2020',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: AppConfig
                                                      .colors.blackGrey,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 7,
                                          child: Text(
                                            'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod tempor \n incididunt ut labore et dolore magna aliqua. ',
                                            style: TextStyle(
                                                color:
                                                    AppConfig.colors.whiteColor,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ));
        });
  }
}
