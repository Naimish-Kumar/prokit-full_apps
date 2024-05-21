import 'package:flutter/material.dart';
import 'package:job_search/screens/JSSignUpScreen.dart';
import 'package:job_search/utils/JSColors.dart';
import 'package:job_search/utils/JSImage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/main.dart';

class JSSplashScreen extends StatefulWidget {
  const JSSplashScreen({Key? key}) : super(key: key);

  @override
  _JSSplashScreenState createState() => _JSSplashScreenState();
}

class _JSSplashScreenState extends State<JSSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(Colors.transparent);
    await 3.seconds.delay;
    finish(context);
    JSSignUpScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(js_SplashImage, height: 130,fit: BoxFit.cover,color:appStore.isDarkModeOn?white: js_primaryColor),
          Image.asset(js_loader, height: 35.0, width: 35.0),
        ],
      ).center(),
    );
  }
}
