import 'package:flutter/material.dart';
import 'package:prokit_flutter/screen/dashboard_screens/activity_screen.dart';
import 'package:prokit_flutter/screen/dashboard_screens/home_screen.dart';
import 'package:prokit_flutter/screen/dashboard_screens/profile_screen.dart';
import 'package:prokit_flutter/screen/dashboard_screens/search_screen.dart';
import 'package:prokit_flutter/utils/config.dart';

import '../../utils/common_widgets.dart';

class DashboardScreen extends StatefulWidget {
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0, keepPage: true);
  DateTime currentTime = DateTime.now();
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          if (currentTime.difference(currentTime) > Duration(milliseconds: 2000)) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.grey.shade800,
                duration: Duration(milliseconds: 1500),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultRadius), topRight: Radius.circular(defaultRadius)),
                ),
                content: Text('Press back again to exit!', style: secondaryTextStyle())));
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: [
          HomeScreen(),
          SearchScreen(),
          ActivityScreen(),
          ProfileScreen(),
        ][currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        backgroundColor: Colors.black38,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home_filled),
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.search_rounded),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite_rounded),
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.account_circle_rounded),
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
