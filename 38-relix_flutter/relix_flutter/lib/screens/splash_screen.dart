import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/app_scaffold.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/images.dart';
import 'walk_through/walk_through_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    afterBuildCreated(() async {
      setStatusBarColor(Colors.transparent, statusBarBrightness: Brightness.dark, statusBarIconBrightness: Brightness.light);

      finish(context);
      await 3.seconds.delay;
      WalkThroughScreen().launch(context, isNewTask: true);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Image.asset(app_logo, height: 100, width: 100).center(),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: SpinKitCircle(color: loaderColor, duration: Duration(seconds: 2)),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Text(APP_NAME, style: boldTextStyle(size: 30, color: textPrimaryColorGlobal)).center(),
          ),
        ],
      ),
    );
  }
}
