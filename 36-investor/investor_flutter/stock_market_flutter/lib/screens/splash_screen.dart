import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stock_investment_flutter/screens/walkthrough_screen.dart';
import 'package:stock_investment_flutter/utils/common.dart';
import 'package:stock_investment_flutter/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
    await 2.seconds.delay.then((value) {
      WalkThroughScreen().launch(context, isNewTask: true);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonCachedNetworkImage(splash_logo, fit: BoxFit.cover, color: greenColor, width: 100, height: 100),
            24.height,
            Text('Stock Investment', style: boldTextStyle(size: 24)),
          ],
        ),
      ),
    );
  }
}
