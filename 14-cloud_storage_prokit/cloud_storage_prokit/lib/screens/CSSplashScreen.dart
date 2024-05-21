import 'package:cloudstorage_prokit/main.dart';
import 'package:cloudstorage_prokit/utils/CSWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:cloudstorage_prokit/screens/CSStartingScreen.dart';
import 'package:cloudstorage_prokit/utils/CSConstants.dart';
import 'package:cloudstorage_prokit/utils/CSImages.dart';

class CSSplashScreen extends StatefulWidget {
  static String tag = '/CSSplashScreen';

  @override
  CSSplashScreenState createState() => CSSplashScreenState();
}

class CSSplashScreenState extends State<CSSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    checkFirstSeen();
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
  }

  Future checkFirstSeen() async {
    await Future.delayed(Duration(seconds: 3));
    finish(context);
    CSStartingScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          commonCacheImageWidget(CSCloudboxLogo, height: 150, width: 150, fit: BoxFit.fill).center(),
          Positioned(
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('From', style: secondaryTextStyle()),
                Text(CSAppName, style: boldTextStyle(size: 25)),
              ],
            ).paddingBottom(16),
          )
        ],
      ),
    );
  }
}
