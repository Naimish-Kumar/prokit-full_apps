import 'package:flutter/material.dart';
import 'package:proscan/screens/contact_us_screen.dart';
import 'package:proscan/screens/faq_screen.dart';
import 'package:proscan/utils/color.dart';
import 'package:proscan/utils/common.dart';

import 'account_screen.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Help Center", style: boldTextStyle(fontSize: 24)),
          elevation: 0,
          iconTheme: IconThemeData(color: mode.theme ? Colors.white : Colors.black),
          bottom: TabBar(
            labelColor: primaryColor,
            labelStyle: boldTextStyle(fontSize: 18),
            unselectedLabelColor: Colors.grey,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
            unselectedLabelStyle: primaryTextStyle(color: Colors.grey, fontSize: 16),
            indicatorColor: primaryColor,
            indicator: UnderlineTabIndicator(borderSide: BorderSide(color: primaryColor, width: 2)),
            tabs: [
              Tab(
                text: "FAQ",
              ),
              Tab(
                text: "Contact us",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [FAQScreen(), ContactUsScreen()],
        ),
      ),
    );
  }
}
