import 'package:flutter/material.dart';
import 'package:opensea_ui/fragments/NMPMoreFragment.dart';
import 'package:opensea_ui/fragments/NMPHomeFragment.dart';
import 'package:opensea_ui/fragments/NMPProfileFragment.dart';
import 'package:opensea_ui/fragments/NMPRankingsFragment.dart';
import 'package:opensea_ui/fragments/NMPSearchFragment.dart';
import 'package:opensea_ui/main.dart';
import 'package:opensea_ui/utils/OSCommon.dart';

class NMPDashboardScreen extends StatefulWidget {
  @override
  State<NMPDashboardScreen> createState() => _NMPDashboardScreenState();
}

class _NMPDashboardScreenState extends State<NMPDashboardScreen> {
  int index = 0;
  List<Widget> widgets = [NMPHomeFragment(), NMPRankingsFragment(), NMPSearchFragment(), NMPProfileFragment(), NMPMoreFragment()];

  @override
  void initState() {
    osSetStatusBarColor(statusBarColor: themeStore.isDarkMode ? Colors.black : Colors.white);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (i) {
          index = i;
          setState(
            () {},
          );
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Rankings'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: 'More'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
