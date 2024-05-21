import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:scribblr/components/text_styles.dart';
import 'package:scribblr/utils/images.dart';

import '../main.dart';
import '../utils/colors.dart';
import 'walkthrough_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => WalkthroughScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appStore.isDarkMode ? scaffoldDarkColor : scaffoldPrimaryLight,
      statusBarIconBrightness: appStore.isDarkMode ? Brightness.light : Brightness.dark,
    ));
    return Observer(builder: (context) {
      return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(app_logo, fit: BoxFit.cover, width: 100)),
              15.height,
              Center(
                child: Text('Scribblr',
                    style: primarytextStyle(
                        size: 20, color: appStore.isDarkMode ? Colors.white : Colors.black)),
              ),
              15.height,
              Center(child: Lottie.asset(loader_lottie, width: 100, fit: BoxFit.cover)),
            ],
          ),
        ),
      );
    });
  }
}
