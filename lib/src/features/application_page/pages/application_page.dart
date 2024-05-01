import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/pages/home.dart';
import 'package:iitm_app/src/features/profile/pages/profile_page.dart';
import 'package:iitm_app/src/features/report/pages/report.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  List<Widget> pages = <Widget>[
     HomePage(),
    ReportPage(),
    const ProfilePage(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.blue,
        ),
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.black54),
        useLegacyColorScheme: false,
        items: [
          BottomNavigationBarItem(
            icon: iconWidget(
              0,
              index,
              "assets/icons/home-100.png",
              "assets/icons/home-100-2.png",
            ),
            label: "homeNav".tr,
          ),
          BottomNavigationBarItem(
            icon: iconWidget(1, index, "assets/icons/openbook.jpg",
                "assets/icons/openbook.jpg"),
            label: "reportNav".tr,
          ),
          BottomNavigationBarItem(
            icon: iconWidget(2, index, "assets/icons/user-outline.png",
                "assets/icons/user-filled.png"),
            label: "profile".tr,
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }

  CircleAvatar iconWidget(int defaultIndex, int currentIndex, String iconPath,
      String selectedIconPath) {
    return CircleAvatar(
      radius: 20,
      backgroundColor:
          currentIndex == defaultIndex ? Colors.blue : Colors.transparent,
      foregroundColor:
          currentIndex == defaultIndex ? Colors.white : Colors.grey,
      child: Center(
        child: Image.asset(
          currentIndex == defaultIndex ? selectedIconPath : iconPath,
          color: index == defaultIndex ? Colors.white : Colors.grey,
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
