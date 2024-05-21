import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:banking_prokit/screen/BankingWalkThrough.dart';
import 'package:banking_prokit/utils/BankingColors.dart';
import 'package:banking_prokit/utils/BankingContants.dart';
import 'package:banking_prokit/utils/BankingStrings.dart';

class BankingSplash extends StatefulWidget {
  static String tag = '/BankingSplash';

  @override
  _BankingSplashState createState() => _BankingSplashState();
}

class _BankingSplashState extends State<BankingSplash> {
  void initState() {
    setStatusBarColor(Banking_palColor);
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    setState(
      () {
        // finish(context);
        BankingWalkThrough().launch(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topLeft,
                  colors: [Banking_Primary, Banking_palColor],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Banking_lbl_app_Name,
                    style: boldTextStyle(color: Banking_TextColorWhite, size: 30),
                  ).paddingOnly(bottom: spacing_standard),
                  Text(Banking_lbl_app_Sub_title, style: boldTextStyle(color: Banking_TextColorWhite, size: 14)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
