import 'package:flutter/material.dart';
import 'package:mealime_app/screens/MIAWelcomeScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class MIASplashScreen extends StatefulWidget {
  const MIASplashScreen({Key? key}) : super(key: key);

  @override
  _MIASplashScreenState createState() => _MIASplashScreenState();
}

class _MIASplashScreenState extends State<MIASplashScreen> {
  @override
  void initState() {
    super.initState();
    //
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
    await 3.seconds.delay;
    finish(context);
    MIAWelcomeScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset('images/mealime_app_logo.png', height: 200).center());
  }
}
