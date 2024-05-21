import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:proscan/screens/walkthrough_screen.dart';
import 'package:proscan/utils/common.dart';

import '../utils/color.dart';
import '../utils/images.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => WalkthroughScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(splash_screen_image, color: primaryColor, height: height * 0.3, width: width * 0.40),
                  Text("ProScan", style: boldTextStyle(fontSize: 30)),
                ],
              )),
          Positioned(
            height: height * 0.1,
            width: width * 1,
            bottom: 80,
            child: SpinKitCircle(
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
