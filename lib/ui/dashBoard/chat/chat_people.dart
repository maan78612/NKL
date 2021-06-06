import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nlk/constants/app_constants.dart';
import 'package:nlk/provider/appProvider.dart';
import 'package:nlk/ui/widgets/selection_tile.dart';
import 'package:nlk/ui/widgets/top_bar.dart';
import 'package:provider/provider.dart';

class ChatPeople extends StatefulWidget {
  @override
  _ChatPeopleState createState() => _ChatPeopleState();
}

class _ChatPeopleState extends State<ChatPeople> {
  List<String> filters = ["All", "Selling", "Buying"];
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
                      height: Get.height * 0.005,
                    ),
                    TopBar(
                      withBackButton: false,
                      title: "Chat",
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
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
                          child:
                              ListView.builder(itemBuilder: (context, index) {
                            return contact();
                          })),
                    ),
                  ],
                ),
              ),
            ));
  }

  Widget contact() {
    return ListTile(
      leading: CircleAvatar(
        radius: Get.height * 0.03,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(AppConfig.images.image1),
      ),
      title: Text(
        'Majid Ali',
        style: GoogleFonts.roboto(
          fontSize: 19.0,
          color: Colors.black,
          letterSpacing: 0.38,
          fontWeight: FontWeight.w700,
          height: 0.84,
        ),
      ),
      subtitle: Text(
        'Lorem ipsum dolor sit amet,',
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 15.0,
          color: Colors.grey,
        ),
      ),
      trailing: Text(
        'Just Now',
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 12.0,
          color: Colors.grey,
        ),
      ),
    );
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
