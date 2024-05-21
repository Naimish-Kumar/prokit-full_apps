import 'package:coinpro_prokit/main.dart';
import 'package:coinpro_prokit/screen/CPWalkThroughScreen.dart';
import 'package:coinpro_prokit/utils/CPColors.dart';
import 'package:coinpro_prokit/utils/CPImages.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CPSplashScreen extends StatefulWidget {
  @override
  CPSplashScreenState createState() => CPSplashScreenState();
}

class CPSplashScreenState extends State<CPSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 3));
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
    CPWalkThroughScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment(-0.0, -1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image(image: AssetImage(cp_profits), height: 60, width: 60, fit: BoxFit.cover, color: CPPrimaryColor),
            SizedBox(height: 8),
            Text(
              "CoinPro",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
