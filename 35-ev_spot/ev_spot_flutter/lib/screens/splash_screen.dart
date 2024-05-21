import 'package:ev_spot_flutter/components/app_logo_image_component.dart';
import 'package:ev_spot_flutter/main.dart';
import 'package:ev_spot_flutter/screens/sign_in_screen.dart';
import 'package:ev_spot_flutter/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: appStore.isDarkMode ? Colors.black : Colors.transparent,
        statusBarIconBrightness: appStore.isDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            AppLogoImageComponent(isCenter: true),
            Positioned(
              bottom: 0,
              child: Container(width: MediaQuery.of(context).size.width, child: Image.asset(splash_image2, fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
