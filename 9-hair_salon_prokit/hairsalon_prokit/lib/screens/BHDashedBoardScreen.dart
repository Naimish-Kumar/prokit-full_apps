import 'package:flutter/material.dart';
import 'package:hairsalon_prokit/main.dart';
import 'package:hairsalon_prokit/utils/BHColors.dart';
import 'package:hairsalon_prokit/utils/BHWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'BHAppointmentScreen.dart';
import 'BHDiscoverScreen.dart';
import 'BHMessagesScreen.dart';
import 'BHNotifyScreen.dart';
import 'BHProfileScreen.dart';

class BHDashedBoardScreen extends StatefulWidget {
  static String tag = '/DashedBoardScreen';

  @override
  BHDashedBoardScreenState createState() => BHDashedBoardScreenState();
}

class BHDashedBoardScreenState extends State<BHDashedBoardScreen> {
  int _selectedIndex = 0;
  var _pages = <Widget>[
    BHDiscoverScreen(),
    BHNotifyScreen(),
    BHAppointmentScreen(),
    BHMessagesScreen(),
    BHProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: BHColorPrimary),
      selectedItemColor: BHColorPrimary,
      unselectedLabelStyle: TextStyle(color: BHGreyColor),
      unselectedItemColor: BHGreyColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Discover'),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Notify'),
        BottomNavigationBarItem(icon: Icon(Icons.date_range), label: 'Appointment'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _bottomTab(),
        body: Center(child: _pages.elementAt(_selectedIndex)),
      ),
    );
  }
}
