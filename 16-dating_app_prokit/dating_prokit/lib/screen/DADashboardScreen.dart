import 'package:dating_prokit/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:dating_prokit/fragment/DAHomeFragment.dart';
import 'package:dating_prokit/fragment/DAInboxFragment.dart';
import 'package:dating_prokit/fragment/DAMatchesFragment.dart';
import 'package:dating_prokit/fragment/DAProfileFragment.dart';
import 'package:dating_prokit/utils/DAColors.dart';

class DADashboardScreen extends StatefulWidget {
  @override
  DADashboardScreenState createState() => DADashboardScreenState();
}

class DADashboardScreenState extends State<DADashboardScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    DAHomeFragment(),
    DAInboxFragment(),
    DAMatchesFragment(),
    DAProfileFragment(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: context.cardColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: appStore.isDarkModeOn ? white : black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
